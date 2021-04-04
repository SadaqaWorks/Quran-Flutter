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
      @HiveField(2) required String url,
      @HiveField(3) required bool required,
      @HiveField(4) required ResourceType resourceType,
      @HiveField(5) required FileType fileType,
      @HiveField(6) required int version,
      @HiveField(7) required bool needRefresh,
      @HiveField(8) required bool downloaded,
      @HiveField(9) required bool bundled,
      @HiveField(10) bool? selected,
      @HiveField(11) String? description}) = _Resource;
  factory Resource.fromJson(Map<String, dynamic> json) =>
      _$ResourceFromJson(json);

  static final quranFiles = [
    Resource(
        id: 0,
        name: 'ayahinfo_1280.db',
        required: true,
        version: 1,
        resourceType: ResourceType.ayahInfo,
        fileType: FileType.db,
        needRefresh: false,
        downloaded: true,
        bundled: false,
        description: '',
        url:
            'https://raw.githubusercontent.com/SadaqaWorks/IslamicDatabase/master/Quran/db/ayahinfo_1280.db')
  ];
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
