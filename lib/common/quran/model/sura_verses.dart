import 'package:json_annotation/json_annotation.dart';
import 'package:quran_reader/common/quran/model/verse.dart';

part 'sura_verses.g.dart';

@JsonSerializable()
class SuraVerses {
  int suraId;
  List<Verse> verses;

  SuraVerses({required this.suraId, required this.verses});

  @override
  String toString() {
    return 'suraId: ${suraId} verse ${verses}';
  }

  factory SuraVerses.fromJson(Map<String, dynamic> json) =>
      _$SuraVersesFromJson(json);

  Map<String, dynamic> toJson() => _$SuraVersesToJson(this);
}
