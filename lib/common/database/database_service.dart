import 'dart:io';

import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

abstract class DatabaseService {
  Future<Database> openDatabaseConnection(
    String databaseName,
    String databasePathBundle, {
    bool isReadOnly = true,
    bool deleteFirst = false,
  }) async {
    // Copy from project assets to device
    var databasePath = await getDatabasesPath();
    var path = join(databasePath, databaseName);
    if (deleteFirst) {
      await deleteDatabase(path);
    }
    bool fileExists = File(path).existsSync();
    if (!fileExists) {
      // Move checking database dir
      var byteData = await rootBundle.load(databasePathBundle);
      var bytes = byteData.buffer.asUint8List(0, byteData.lengthInBytes);
      await File(path).writeAsBytes(bytes);
    }
    Database database = isReadOnly
        ? await openReadOnlyDatabase(path)
        : await openDatabase(path);
    return database;
  }
}
