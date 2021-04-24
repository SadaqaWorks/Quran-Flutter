import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'resource.freezed.dart';
part 'resource.g.dart';

@freezed
class Resource with _$Resource {
  @HiveType(typeId: 1)
  const factory Resource(
      {@HiveField(0) required int id,
      @HiveField(1) required String name,
      @HiveField(2) required String title,
      @HiveField(3) required String url,
      @HiveField(4) required bool required,
      @HiveField(5) required ResourceType resourceType,
      @HiveField(6) required FileType fileType,
      @HiveField(7) required int version,
      @HiveField(8) required bool needRefresh,
      @HiveField(9) required bool downloaded,
      @HiveField(10) required bool bundled,
      @HiveField(11) bool? selected,
      @HiveField(12) String? description}) = _Resource;

  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);
}

const resourceTypeString = <ResourceType, String>{
  ResourceType.ayahInfo: "ayahInfo",
  ResourceType.wordByWord: "wordByWord",
  ResourceType.translation: "translation",
  ResourceType.audio: "audio",
  ResourceType.page: "page",
};

@HiveType(typeId: 2)
enum ResourceType {
  @HiveField(0)
  ayahInfo,
  @HiveField(1)
  translation,
  @HiveField(2)
  wordByWord,
  @HiveField(3)
  audio,
  @HiveField(4)
  page
}

@HiveType(typeId: 3)
enum FileType {
  @HiveField(0)
  json,
  @HiveField(1)
  db,
  @HiveField(2)
  imageZip
}

enum ResourcesConstants { resources, needRefresh, syncedTime }
