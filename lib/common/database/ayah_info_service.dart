import 'dart:io';

import 'package:quran_reader/common/database/database_service.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:quran_reader/feature/sura/model/models.dart';
import 'package:sqflite/sqflite.dart';

abstract class IAyahInfoService {
  Future<List<QuranPageInfo>> getQuranPageInfoList({
    int? pageNumber,
  });

  Future<QuranPageInfo> getQuranPageInfo({
    int? suraNumber,
  });

  Future<List<Sura>> getSuraList();

  void dispose();
}

class AyahInfoService extends DatabaseService implements IAyahInfoService {
  Database? ayahInfoDatabase;

  AyahInfoService._create();

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
        ayahInfoDatabase!.close();
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

  Future<List<QuranPageInfo>> getQuranPageInfoList({
    int? pageNumber,
  }) async {
    if (ayahInfoDatabase == null) {
      await initDatabase();
    }

    if (ayahInfoDatabase == null) {
      return [];
    }

    List<Map> maps = await ayahInfoDatabase!.rawQuery(
        "select glyphs.ayah_number,glyphs.page_number, glyphs.sura_number,sura.sura_number,sura.name_arabic,sura.name_english as name,sura.type  from glyphs  INNER join sura on glyphs.sura_number=sura.sura_number where page_number =  $pageNumber");
    return maps.map((e) => QuranPageInfo.fromJson(e as Map<String, dynamic>)).toList();
  }

  Future<QuranPageInfo> getQuranPageInfo({
    int? suraNumber,
  }) async {
    if (ayahInfoDatabase == null) {
      await initDatabase();
    }

    List<Map> maps = await ayahInfoDatabase!.rawQuery(
        "select glyphs.ayah_number,glyphs.page_number, glyphs.sura_number,sura.sura_number,sura.name_arabic,sura.name_english as name,sura.type  from glyphs  INNER join sura on glyphs.sura_number=sura.sura_number where glyphs.sura_number =  $suraNumber limit 1");
    return maps.map((e) => QuranPageInfo.fromJson(e as Map<String, dynamic>)).first;
  }

  Future<List<Sura>> getSuraList() async {
    if (ayahInfoDatabase == null) {
      await initDatabase();
    }

    if (ayahInfoDatabase == null) {
      return [];
    }

    List<Map> maps = await ayahInfoDatabase!.rawQuery(
        "select sura.sura_number,sura.name_arabic, sura.name_english as name from sura");
    return maps.map((e) => Sura.fromJson(e as Map<String, dynamic>)).toList();
  }

  void dispose() {
    ayahInfoDatabase?.close();
    ayahInfoDatabase = null;
  }
}
