import 'package:quran_reader/common/resource/file_service.dart';
import 'package:quran_reader/common/resource/model/resource.dart';
import 'package:quran_reader/common/result/database_avaiablity_result.dart';
import 'package:quran_reader/common/result/repository_result.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:quran_reader/feature/sura/model/models.dart';
import 'package:sqflite/sqflite.dart';

class AyahInfoRepository extends IFileService {
  static Database? ayahInfoDatabase;

  AyahInfoRepository();

  AyahInfoRepository._create();
  static Future<AyahInfoRepository> create() async {
    var component = AyahInfoRepository._create();

    await component.initDatabase();

    return component;
  }

  FileService _fileService = FileService();

  Future initDatabase() async {
    if (ayahInfoDatabase == null) {
      if (ayahInfoDatabase?.isOpen == true) {
        ayahInfoDatabase?.close();
        ayahInfoDatabase = null;
        await Future.delayed(Duration(microseconds: 50));
      }

      final quranFile = Resource.quranFiles.firstWhere(
          (element) => element.resourceType == ResourceType.ayahInfo);

      final response = await _fileService.openDatabaseConnection(
        Resource.quranFiles.firstWhere(
            (element) => element.resourceType == ResourceType.ayahInfo),
        isReadOnly: false,
      );

      response.fold((RepositoryResult l) {
        if (l is DatabaseNotAvailableResult) {
          if (quranFile.required) {
            //TODO:- Download file
          }
        }
        return l;
      }, (r) {
        ayahInfoDatabase = r;
      });
    }
  }

  void dispose() {
    ayahInfoDatabase?.close();
    ayahInfoDatabase = null;
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
    return maps
        .map((e) => QuranPageInfo.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<QuranPageInfo> getQuranPageInfo({
    int? suraNumber,
  }) async {
    if (ayahInfoDatabase == null) {
      await initDatabase();
    }

    List<Map> maps = await ayahInfoDatabase!.rawQuery(
        "select glyphs.ayah_number,glyphs.page_number, glyphs.sura_number,sura.sura_number,sura.name_arabic,sura.name_english as name,sura.type  from glyphs  INNER join sura on glyphs.sura_number=sura.sura_number where glyphs.sura_number =  $suraNumber limit 1");
    return maps
        .map((e) => QuranPageInfo.fromJson(e as Map<String, dynamic>))
        .first;
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
}
