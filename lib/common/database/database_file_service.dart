import 'dart:io';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class IDatabaseFileService {
  Future deleteDatabase(String filename) {
    return null;
  }
}

class DatabaseFileService implements IDatabaseFileService {

  @override
  Future deleteDatabase(String filename) async {
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, filename);
    var file = File(path);
    if (file.existsSync()) {
      await file.delete();
    }
  }
}
