// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  return QuranPage(
    pageNumber: json['pageNumber'] as int,
    imageUrl: json['imageUrl'] as String?,
    quranPageInfoList: (json['quranPageInfoList'] as List<dynamic>?)
        ?.map((e) => QuranPageInfo.fromJson(e as Map<String, dynamic>))
        .toList(),
    suraVerses: (json['suraVerses'] as List<dynamic>?)
        ?.map((e) => SuraVerses.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$QuranPageToJson(QuranPage instance) => <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'imageUrl': instance.imageUrl,
      'quranPageInfoList': instance.quranPageInfoList,
      'suraVerses': instance.suraVerses,
    };
