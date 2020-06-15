part of 'quran_page_info.dart';

QuranPageInfo _$QuranPageInfoFromJson(Map<String, dynamic> json) {
  return QuranPageInfo(
      pageNumber: json['page_number'] as int,
      lineNumber: json['line_number'] as int,
      suraNumber: json['sura_number'] as int,
      ayahNumber: json['ayah_number'] as int,
      position: json['position'] as int,
      minX: json['min_x'] as int,
      minY: json['min_y'] as int,
      maxX: json['max_x'] as int,
      maxY: json['max_y'] as int,
      nameEnglish: json['name_english'] as String);
}

Map<String, dynamic> _$QuranPageInfoToJson(QuranPageInfo instance) =>
    <String, dynamic>{
      'page_number': instance.pageNumber,
      'line_number': instance.lineNumber,
      'sura_number': instance.suraNumber,
      'ayah_number': instance.ayahNumber,
      'position': instance.position,
      'min_x': instance.minX,
      'min_y': instance.minY,
      'max_x': instance.maxX,
      'max_y': instance.maxY,
      'name_english': instance.nameEnglish
    };
