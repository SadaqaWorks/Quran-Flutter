// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_QuranPage _$$_QuranPageFromJson(Map<String, dynamic> json) => _$_QuranPage(
      json['pageNumber'] as int,
      ImageFile.fromJson(json['imageFile'] as Map<String, dynamic>),
      suraVerses: (json['suraVerses'] as List<dynamic>?)
          ?.map((e) => SuraVerses.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_QuranPageToJson(_$_QuranPage instance) =>
    <String, dynamic>{
      'pageNumber': instance.pageNumber,
      'imageFile': instance.imageFile,
      'suraVerses': instance.suraVerses,
    };

_$_ImageFile _$$_ImageFileFromJson(Map<String, dynamic> json) => _$_ImageFile(
      json['imageUrl'] as String,
      _$enumDecode(_$ImageLoadPolicyEnumMap, json['loadPolicy']),
    );

Map<String, dynamic> _$$_ImageFileToJson(_$_ImageFile instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'loadPolicy': _$ImageLoadPolicyEnumMap[instance.loadPolicy],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$ImageLoadPolicyEnumMap = {
  ImageLoadPolicy.cache: 'cache',
  ImageLoadPolicy.network: 'network',
};
