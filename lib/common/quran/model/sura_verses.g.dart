// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura_verses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SuraVerses _$SuraVersesFromJson(Map<String, dynamic> json) {
  return SuraVerses(
    suraId: json['suraId'] as int,
    verses: (json['verses'] as List<dynamic>)
        .map((e) => Verse.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SuraVersesToJson(SuraVerses instance) =>
    <String, dynamic>{
      'suraId': instance.suraId,
      'verses': instance.verses,
    };
