import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:moor/ffi.dart';
import 'package:moor/moor.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart' as paths;
import 'package:quran_reader/common/database/model/database.dart';
import 'package:quran_reader/common/database/model/database_file.dart';

EasyDatabase constructDb(
    {required DatabaseFile databaseFile, bool logStatements = false}) {
  if (Platform.isIOS ||
      Platform.isAndroid ||
      Platform.isMacOS ||
      Platform.isLinux) {
    final executor = LazyDatabase(() async {
      final dbFolder = await paths.getApplicationDocumentsDirectory();
      final filePath = path.join(dbFolder.path, databaseFile.name);
      bool exists = await File(filePath).exists();
      if (exists) {
        return VmDatabase(File(filePath), logStatements: logStatements);
      } else {
        var httpClient = new HttpClient();
        var request = await httpClient.getUrl(Uri.parse(databaseFile.url));
        var response = await request.close();

        if (response.statusCode != 200) throw "Error getting db file";

        var bytes = await consolidateHttpClientResponseBytes(response);

        File file = File(filePath);
        await file.writeAsBytes(bytes);
        return VmDatabase(File(filePath), logStatements: logStatements);
      }
    });
    return EasyDatabase(executor);
  }
  // if (Platform.isMacOS || Platform.isLinux) {
  //   final file = File('db.sqlite');
  //   return EasyDatabase(VmDatabase(file, logStatements: logStatements));
  // }
  // if (Platform.isWindows) {
  //   final file = File('db.sqlite');
  //   return Database(VMDatabase(file, logStatements: logStatements));
  // }
  return EasyDatabase(VmDatabase.memory(logStatements: logStatements));
}
