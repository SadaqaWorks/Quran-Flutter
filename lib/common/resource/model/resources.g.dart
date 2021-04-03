// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resources.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResourcesAdapter extends TypeAdapter<_$_Resources> {
  @override
  final int typeId = 4;

  @override
  _$_Resources read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return _$_Resources(
      storedTime: fields[0] as DateTime,
      list: (fields[1] as List).cast<Resource>(),
    );
  }

  @override
  void write(BinaryWriter writer, _$_Resources obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.storedTime)
      ..writeByte(1)
      ..write(obj.list);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourcesAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Resources _$_$_ResourcesFromJson(Map<String, dynamic> json) {
  return _$_Resources(
    storedTime: DateTime.parse(json['storedTime'] as String),
    list: (json['list'] as List<dynamic>)
        .map((e) => Resource.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$_$_ResourcesToJson(_$_Resources instance) =>
    <String, dynamic>{
      'storedTime': instance.storedTime.toIso8601String(),
      'list': instance.list,
    };
