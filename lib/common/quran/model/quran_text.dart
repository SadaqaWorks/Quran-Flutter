import 'package:json_annotation/json_annotation.dart';

part 'quran_text.g.dart';

@JsonSerializable()
class QuranText {
  int sura;
  int ayah;
  int text;
  String? extraData;

  QuranText(
      {required this.sura,
      required this.ayah,
      required this.text,
      this.extraData});
}
