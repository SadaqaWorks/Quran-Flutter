import 'dart:async';
import 'dart:convert';
import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quran_reader/common/model/resource/resource.dart';
import 'package:quran_reader/common/storage/repository/file_service_state.dart';
import 'package:sqflite/sqflite.dart';

abstract class IFileService {
  void dispose();
}

typedef void OnDownloadProgressCallback(int receivedBytes, int totalBytes);
typedef void OnUploadProgressCallback(int sentBytes, int totalBytes);

class FileService {
  static bool trustSelfSigned = true;

  static io.HttpClient getHttpClient() {
    io.HttpClient httpClient = new io.HttpClient()
      ..connectionTimeout = const Duration(seconds: 10)
      ..badCertificateCallback =
          ((io.X509Certificate cert, String host, int port) => trustSelfSigned);

    return httpClient;
  }

  Future<FileServiceState> openDatabaseConnection(
    Resource resource, {
    bool isReadOnly = true,
    bool deleteFirst = false,
  }) async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(documentDirectory.path, resource.name);
    bool dbExists = await io.File(dbPath).exists();

    if (dbExists) {
      if (!resource.downloaded) {
        await deleteDatabase(dbPath);
        await deleteFile(dbPath);

        if (resource.required) {
          final fileResult = await fileDownload(resource.url, dbPath,
              onDownloadProgress: (int receivedBytes, int totalBytes) {});

          if (fileResult) {
            Database database = isReadOnly
                ? await openReadOnlyDatabase(dbPath)
                : await openDatabase(dbPath);
            return FileServiceState.available(database);
          } else {
            return FileServiceState.notAvailable();
          }
        }
      }

      Database database = isReadOnly
          ? await openReadOnlyDatabase(dbPath)
          : await openDatabase(dbPath);
      return FileServiceState.available(database);
    } else {
      if (resource.required) {
        final fileResult = await fileDownload(resource.url, dbPath);

        if (fileResult) {
          Database database = isReadOnly
              ? await openReadOnlyDatabase(dbPath)
              : await openDatabase(dbPath);
          return FileServiceState.available(database);
        } else {
          return FileServiceState.notAvailable();
        }
      } else {
        return FileServiceState.notAvailable();
      }
    }
  }

  Future<bool> downloadFile(String url, String path) async {
    var httpClient = new io.HttpClient();
    var request = await httpClient.getUrl(Uri.parse(url));
    var response = await request.close();

    if (response.statusCode != 200) {
      return false;
    }

    var bytes = await consolidateHttpClientResponseBytes(response);

    io.File file = new io.File(path);
    await file.writeAsBytes(bytes);
    return true;
  }

  Future deleteFile(String path) async {
    var file = io.File(path);
    if (file.existsSync()) {
      await file.delete();
    }
  }

  static Future<bool> fileDownload(String uri, String path,
      {OnDownloadProgressCallback? onDownloadProgress}) async {
    final url = Uri.encodeFull(uri);

    final httpClient = getHttpClient();

    final request = await httpClient.getUrl(Uri.parse(url));

    request.headers
        .add(io.HttpHeaders.contentTypeHeader, "application/octet-stream");

    var httpResponse = await request.close();

    Completer<bool> completer = Completer();

    if (httpResponse.statusCode != 200) {
      completer.completeError(false);
    }
    int byteCount = 0;
    int totalBytes = httpResponse.contentLength;

    io.File file = new io.File(path);

    var raf = file.openSync(mode: io.FileMode.write);

    httpResponse.listen(
      (data) {
        byteCount += data.length;

        raf.writeFromSync(data);

        if (onDownloadProgress != null) {
          onDownloadProgress(byteCount, totalBytes);
        }
      },
      onDone: () {
        raf.closeSync();

        completer.complete(true);
      },
      onError: (e) {
        raf.closeSync();
        file.deleteSync();
        completer.completeError(false);
      },
      cancelOnError: true,
    );

    return completer.future;
  }

  static Future<String> fileUpload(io.File file, String url,
      {OnUploadProgressCallback? onUploadProgress}) async {
    final fileStream = file.openRead();

    int totalByteLength = file.lengthSync();

    final httpClient = getHttpClient();

    final request = await httpClient.postUrl(Uri.parse(url));

    request.headers
        .set(io.HttpHeaders.contentTypeHeader, io.ContentType.binary);

    request.headers.add("filename", path.basename(file.path));

    request.contentLength = totalByteLength;

    int byteCount = 0;
    Stream<List<int>> streamUpload = fileStream.transform(
      new StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          byteCount += data.length;

          if (onUploadProgress != null) {
            onUploadProgress(byteCount, totalByteLength);
            // CALL STATUS CALLBACK;
          }

          sink.add(data);
        },
        handleError: (error, stack, sink) {
          print(error.toString());
        },
        handleDone: (sink) {
          sink.close();
          // UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();

    if (httpResponse.statusCode != 200) {
      throw Exception('Error uploading file');
    } else {
      return await readResponseAsString(httpResponse);
    }
  }

  static Future<String> fileUploadMultipart(io.File file, String url,
      {OnUploadProgressCallback? onUploadProgress}) async {
    final httpClient = getHttpClient();

    final request = await httpClient.postUrl(Uri.parse(url));

    int byteCount = 0;

    var multipart =
        await MultipartFile.fromPath(path.basename(file.path), file.path);

    var requestMultipart = MultipartRequest("", Uri.parse("uri"));

    requestMultipart.files.add(multipart);

    var msStream = requestMultipart.finalize();

    var totalByteLength = requestMultipart.contentLength;

    request.contentLength = totalByteLength;

    request.headers.set(io.HttpHeaders.contentTypeHeader,
        requestMultipart.headers[io.HttpHeaders.contentTypeHeader]!);

    Stream<List<int>> streamUpload = msStream.transform(
      new StreamTransformer.fromHandlers(
        handleData: (data, sink) {
          sink.add(data);

          byteCount += data.length;

          if (onUploadProgress != null) {
            onUploadProgress(byteCount, totalByteLength);
            // CALL STATUS CALLBACK;
          }
        },
        handleError: (error, stack, sink) {
          throw error;
        },
        handleDone: (sink) {
          sink.close();
          // UPLOAD DONE;
        },
      ),
    );

    await request.addStream(streamUpload);

    final httpResponse = await request.close();
//
    var statusCode = httpResponse.statusCode;

    if (statusCode ~/ 100 != 2) {
      throw Exception(
          'Error uploading file, Status code: ${httpResponse.statusCode}');
    } else {
      return await readResponseAsString(httpResponse);
    }
  }

  static Future<String> readResponseAsString(io.HttpClientResponse response) {
    var completer = new Completer<String>();
    var contents = new StringBuffer();
    response.transform(utf8.decoder).listen((String data) {
      contents.write(data);
    }, onDone: () => completer.complete(contents.toString()));
    return completer.future;
  }
}
