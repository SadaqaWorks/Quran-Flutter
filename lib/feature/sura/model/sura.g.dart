part of 'sura.dart';

Sura _$SuraFromJson(Map<String, dynamic> json) {
  return Sura(
    suraNumber: json['sura_number'] as int?,
    nameArabic: json['name_arabic'] as String?,
    name: json['name'] as String?,
  );
}

Map<String, dynamic> _$SuraToJson(Sura instance) {
  return <String, dynamic>{
    'sura_number': instance.suraNumber,
    'name_arabic': instance.nameArabic,
    'name': instance.name
  };
}
