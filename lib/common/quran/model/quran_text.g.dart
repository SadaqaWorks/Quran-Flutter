// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_text.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

QuranText _$QuranTextFromJson(Map<String, dynamic> json) => QuranText(
      sura: json['sura'] as int,
      ayah: json['ayah'] as int,
      text: json['text'] as int,
      extraData: json['extraData'] as String?,
    );

Map<String, dynamic> _$QuranTextToJson(QuranText instance) => <String, dynamic>{
      'sura': instance.sura,
      'ayah': instance.ayah,
      'text': instance.text,
      'extraData': instance.extraData,
    };
