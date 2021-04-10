import 'dart:core';

abstract class QuranDataSource {
  int startPage();

  int numberOfPages();

  List<int> getPageForSuraArray();

  List<int> getSuraForPageArray();

  List<int> getAyahForPageArray();

  List<int> getPageForJuzArray();

  Map<int, int> getJuzDisplayPageArrayOverride();

  List<int> getNumberOfAyahsForSuraArray();

  List<bool> getIsMakkiBySuraArray();

  List<int> getQuarterStartByPage();

  List<List<int>> getQuartersArray();
}
