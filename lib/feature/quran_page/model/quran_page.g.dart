part of 'quran_page.dart';

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  final maps = jsonDecode(json['quranPageInfoList']) as List;
  final quranPageInfoList = maps.map((e) => QuranPageInfo.fromJson(e)).toList();
  return QuranPage(
      pageNumber: json['page'] as int,
      imageUrl: json['imageUrl'] as String,
      quranPageInfoList: quranPageInfoList);
}

Map<String, dynamic> _$QuranPageToJson(QuranPage instance) {
  String quranPageInfoListJson =
      jsonEncode(instance.quranPageInfoList.map((i) => i.toJson()).toList())
          .toString();
  return <String, dynamic>{
    'page': instance.pageNumber,
    'imageUrl': instance.imageUrl,
    'quranPageInfoList': quranPageInfoListJson
  };
}
