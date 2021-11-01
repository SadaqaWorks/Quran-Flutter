class QuranConstants {
  static int NUMBER_OF_SURAS = 114;
  static int PAGES_FIRST = 1;
  static int FIRST_SURA = 1;
  static int LAST_SURA = 114;
  static int MIN_AYAH = 1;
  static int MAX_AYAH = 286;
  static int JUZ2_COUNT = 30;
}

enum MushafType { madani }

MushafType? mushafTypeFromString(String data) {
  for (MushafType element in MushafType.values) {
    if (element.toString() == data) {
      return element;
    }
  }
  return null;
}
