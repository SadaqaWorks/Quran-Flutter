import 'dart:io';

import 'package:quran_reader/common/database/database_service.dart';
import 'package:quran_reader/feature/home/model/quran_page_info.dart';
import 'package:sqflite/sqflite.dart';

abstract class IAyahInfoService {
  Future<List<QuranPageInfo>> getQuranPageInfo({
    int pageNumber,
  });

  void dispose();
}

class AyahInfoService extends DatabaseService implements IAyahInfoService {
  Database ayahInfoDatabase;

  AyahInfoService._create() {}

  /// Public factory
  static Future<AyahInfoService> create() async {
    // Make sure /database directory created
    var databasePath = await getDatabasesPath();
    var f = Directory(databasePath);
    if (!f.existsSync()) {
      f.createSync();
    }

    var component = AyahInfoService._create();

    await component.initDatabase();

    return component;
  }

  Future initDatabase() async {
    if (ayahInfoDatabase == null) {
      if (ayahInfoDatabase?.isOpen == true) {
        ayahInfoDatabase.close();
        ayahInfoDatabase = null;
        await Future.delayed(Duration(microseconds: 50));
      }
      ayahInfoDatabase = await openDatabaseConnection(
        'ayahinfo_1280.db',
        'assets/quran-data/db/ayahinfo_1280.db',
        isReadOnly: false,
      );
    }
  }

  Future<List<QuranPageInfo>> getQuranPageInfo({
    int pageNumber,
  }) async {
    if (ayahInfoDatabase == null) {
      await initDatabase();
    }

    if (ayahInfoDatabase == null) {
      return [];
    }

    List<Map> maps = await ayahInfoDatabase.rawQuery(
        "select * from glyphs  INNER join sura on glyphs.sura_number=sura.sura_number where page_number =  $pageNumber");
    return maps.map((e) => QuranPageInfo.fromJson(e)).toList();
  }

  void dispose() {
    ayahInfoDatabase?.close();
    ayahInfoDatabase = null;
  }
}
