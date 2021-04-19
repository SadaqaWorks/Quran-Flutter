// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sura.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Sura _$SuraFromJson(Map<String, dynamic> json) {
  return Sura(
    json['id'] as int,
    json['start'] as int,
    json['verses'] as int,
    json['order'] as int,
    json['rukus'] as int,
    json['title'] as String,
    _$enumDecode(_$SuraTypeEnumMap, json['type']),
  );
}

Map<String, dynamic> _$SuraToJson(Sura instance) => <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'verses': instance.verses,
      'order': instance.order,
      'title': instance.title,
      'type': _$SuraTypeEnumMap[instance.type],
      'rukus': instance.rukus,
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

const _$SuraTypeEnumMap = {
  SuraType.meccan: 'meccan',
  SuraType.medinan: 'medinan',
};
