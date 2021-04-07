class Verse {
  int suraId;
  int ayahId;

  Verse({required this.suraId, required this.ayahId});

  @override
  String toString() {
    return 'suraId: ${suraId} ayahId ${ayahId}';
  }
}

class SuraVerses {
  int suraId;
  List<Verse> verses;

  SuraVerses({required this.suraId, required this.verses});

  @override
  String toString() {
    return 'suraId: ${suraId} verse ${verses}';
  }
}
