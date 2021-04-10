import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class VerseRange {
  int startSura;
  int startAyah;
  int endingSura;
  int endingAyah;
  int versesInRange;

  VerseRange(this.startSura, this.startAyah, this.endingSura, this.endingAyah,
      this.versesInRange);

  @override
  String toString() {
    // TODO: implement toString
    return 'startSura: ${startSura} - startAyah: ${startAyah} - endingSura: ${endingSura} - endingAyah: ${endingAyah} - versesInRange: ${versesInRange}';
  }
}
