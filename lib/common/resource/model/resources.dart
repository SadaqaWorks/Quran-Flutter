import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:quran_reader/common/resource/model/resource.dart';

part 'resources.freezed.dart';
part 'resources.g.dart';

@freezed
class Resources with _$Resources {
  @HiveType(typeId: 4)
  const factory Resources(
      {@HiveField(0) required DateTime storedTime,
      @HiveField(1) required List<Resource> list}) = _Resources;

  factory Resources.fromJson(Map<String, dynamic> json) =>
      _$ResourcesFromJson(json);
}
