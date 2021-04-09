import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class SuraAyah {
  int sura;
  int ayah;

  SuraAyah(this.sura, this.ayah);
}
