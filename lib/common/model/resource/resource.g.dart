// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resource.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ResourceTypeAdapter extends TypeAdapter<ResourceType> {
  @override
  final int typeId = 2;

  @override
  ResourceType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ResourceType.ayahInfo;
      case 1:
        return ResourceType.translation;
      case 2:
        return ResourceType.wordByWord;
      case 3:
        return ResourceType.audio;
      case 4:
        return ResourceType.page;
      default:
        return ResourceType.ayahInfo;
    }
  }

  @override
  void write(BinaryWriter writer, ResourceType obj) {
    switch (obj) {
      case ResourceType.ayahInfo:
        writer.writeByte(0);
        break;
      case ResourceType.translation:
        writer.writeByte(1);
        break;
      case ResourceType.wordByWord:
        writer.writeByte(2);
        break;
      case ResourceType.audio:
        writer.writeByte(3);
        break;
      case ResourceType.page:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ResourceTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class FileTypeAdapter extends TypeAdapter<FileType> {
  @override
  final int typeId = 3;

  @override
  FileType read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return FileType.json;
      case 1:
        return FileType.db;
      case 2:
        return FileType.imageZip;
      default:
        return FileType.json;
    }
  }

  @override
  void write(BinaryWriter writer, FileType obj) {
    switch (obj) {
      case FileType.json:
        writer.writeByte(0);
        break;
      case FileType.db:
        writer.writeByte(1);
        break;
      case FileType.imageZip:
        writer.writeByte(2);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FileTypeAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Resource _$$_ResourceFromJson(Map<String, dynamic> json) => _$_Resource(
      id: json['id'] as int,
      name: json['name'] as String,
      title: json['title'] as String,
      url: json['url'] as String,
      required: json['required'] as bool,
      resourceType: _$enumDecode(_$ResourceTypeEnumMap, json['resourceType']),
      fileType: _$enumDecode(_$FileTypeEnumMap, json['fileType']),
      version: json['version'] as int,
      needRefresh: json['needRefresh'] as bool,
      downloaded: json['downloaded'] as bool,
      bundled: json['bundled'] as bool,
      selected: json['selected'] as bool?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$$_ResourceToJson(_$_Resource instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'title': instance.title,
      'url': instance.url,
      'required': instance.required,
      'resourceType': _$ResourceTypeEnumMap[instance.resourceType],
      'fileType': _$FileTypeEnumMap[instance.fileType],
      'version': instance.version,
      'needRefresh': instance.needRefresh,
      'downloaded': instance.downloaded,
      'bundled': instance.bundled,
      'selected': instance.selected,
      'description': instance.description,
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

const _$ResourceTypeEnumMap = {
  ResourceType.ayahInfo: 'ayahInfo',
  ResourceType.translation: 'translation',
  ResourceType.wordByWord: 'wordByWord',
  ResourceType.audio: 'audio',
  ResourceType.page: 'page',
};

const _$FileTypeEnumMap = {
  FileType.json: 'json',
  FileType.db: 'db',
  FileType.imageZip: 'imageZip',
};
