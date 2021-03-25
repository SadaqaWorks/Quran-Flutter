import 'dart:io' as io;

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:quran_reader/common/database/model/database_file.dart';
import 'package:quran_reader/common/result/database_avaiablity_result.dart';
import 'package:quran_reader/common/result/repository_result.dart';
import 'package:sqflite/sqflite.dart';

abstract class IFileService {
  void dispose();
}

abstract class FileService {
  Future<Either<RepositoryResult, Database>> openDatabaseConnection(
    QuranFile quranFile, {
    bool isReadOnly = true,
    bool deleteFirst = false,
  }) async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String dbPath = path.join(documentDirectory.path, quranFile.name);
    bool dbExists = await io.File(dbPath).exists();

    // var databasePath = await getDatabasesPath();
    // var f = Directory(databasePath);
    // if (!f.existsSync()) {
    //   f.createSync();
    // }

    //var path = join(databasePath, quranFile.name);

    if (dbExists) {
      if (quranFile.needRefresh) {
        await deleteDatabase(dbPath);
        await deleteFile(dbPath);

        if (quranFile.required) {
          final fileResult = await downloadFile(quranFile.url, dbPath);

          if (fileResult) {
            Database database = isReadOnly
                ? await openReadOnlyDatabase(dbPath)
                : await openDatabase(dbPath);
            return Right(database);
          } else {
            return Left(DatabaseNotAvailableResult(''));
          }
        }
      }

      Database database = isReadOnly
          ? await openReadOnlyDatabase(dbPath)
          : await openDatabase(dbPath);
      return Right(database);
    } else {
      if (quranFile.required) {
        final fileResult = await downloadFile(quranFile.url, dbPath);

        if (fileResult) {
          Database database = isReadOnly
              ? await openReadOnlyDatabase(dbPath)
              : await openDatabase(dbPath);
          return Right(database);
        } else {
          return Left(DatabaseNotAvailableResult(''));
        }
      } else {
        return Left(DatabaseNotAvailableResult(''));
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
}
