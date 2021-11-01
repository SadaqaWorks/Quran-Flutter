import 'package:json_annotation/json_annotation.dart';

part 'sura_ayah.g.dart';

@JsonSerializable()
class SuraAyah {
  int sura;
  int ayah;

  SuraAyah(this.sura, this.ayah);
}
