// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse_range.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerseRange _$VerseRangeFromJson(Map<String, dynamic> json) => VerseRange(
      json['startSura'] as int,
      json['startAyah'] as int,
      json['endingSura'] as int,
      json['endingAyah'] as int,
      json['versesInRange'] as int,
    );

Map<String, dynamic> _$VerseRangeToJson(VerseRange instance) =>
    <String, dynamic>{
      'startSura': instance.startSura,
      'startAyah': instance.startAyah,
      'endingSura': instance.endingSura,
      'endingAyah': instance.endingAyah,
      'versesInRange': instance.versesInRange,
    };
