part of 'quran_page.dart';

QuranPage _$QuranPageFromJson(Map<String, dynamic> json) {
  return QuranPage(
      page: json['page'] as int, imageUrl: json['imageUrl'] as String);
}

Map<String, dynamic> _$QuranPageToJson(QuranPage instance) =>
    <String, dynamic>{'page': instance.page, 'imageUrl': instance.imageUrl};
