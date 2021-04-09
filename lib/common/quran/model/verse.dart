import 'package:json_annotation/json_annotation.dart';

part 'verse.g.dart';

@JsonSerializable()
class Verse {
  int suraId;
  int ayahId;

  Verse({required this.suraId, required this.ayahId});

  @override
  String toString() {
    return 'suraId: ${suraId} ayahId ${ayahId}';
  }

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

  Map<String, dynamic> toJson() => _$VerseToJson(this);
}
