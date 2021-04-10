import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/constant/quran_constants.dart';
import 'package:quran_reader/common/quran/madani_data_source.dart';
import 'package:quran_reader/common/quran/model/quran_data_source.dart';
import 'package:quran_reader/common/quran/model/sura_ayah.dart';
import 'package:quran_reader/common/quran/model/sura_verses.dart';
import 'package:quran_reader/common/quran/model/verse.dart';
import 'package:quran_reader/common/quran/model/verse_range.dart';

final quranInfoProvider = Provider<QuranInfoRepository>((ref) {
  return QuranInfoRepository(QuranDataSourceMadani());
});

class QuranInfoRepository {
  QuranDataSource quranDataSource;

  late int startPage;
  late int numberOfPages;
  late double numberOfPagesDual;
  late List<int> _suraPageStart;
  late List<int> _pageSuraStart;
  late List<int> _pageAyahStart;
  late List<int> _juzPageStart;
  late Map<int, int> _juzPageOverride;
  late List<int> _pageRub3Start;
  late List<int> _suraNumAyahs;
  late List<bool> _suraIsMakki;
  late List<List<int>> _quarters;

  QuranInfoRepository(this.quranDataSource) {
    _suraPageStart = quranDataSource.getPageForSuraArray();
    _pageSuraStart = quranDataSource.getSuraForPageArray();
    _pageAyahStart = quranDataSource.getAyahForPageArray();
    _juzPageStart = quranDataSource.getPageForJuzArray();
    _juzPageOverride = quranDataSource.getJuzDisplayPageArrayOverride();
    _pageRub3Start = quranDataSource.getQuarterStartByPage();
    _suraNumAyahs = quranDataSource.getNumberOfAyahsForSuraArray();
    _suraIsMakki = quranDataSource.getIsMakkiBySuraArray();
    _quarters = quranDataSource.getQuartersArray();
    numberOfPages = quranDataSource.numberOfPages();
    startPage = quranDataSource.startPage();
    numberOfPagesDual = numberOfPages / 2;
  }

  List<SuraVerses> suraVerseForPage(int page) {
    List<SuraVerses> result = List.empty(growable: true);

    VerseRange verseRange = getVerseRangeForPage(page);
    final suras = getListOfSurahWithStartingOnPage(page);
    if (suras.length == 1) {
      List<Verse> list = List.empty(growable: true);

      for (var i = 1; i <= verseRange.versesInRange; i++) {
        final verse = Verse(suraId: verseRange.startSura, ayahId: i);
        list.add(verse);
      }
      SuraVerses suraVerses =
          SuraVerses(suraId: verseRange.startSura, verses: list);
      result.add(suraVerses);
      return result;
    } else {
      for (var sura = verseRange.startSura;
          sura <= verseRange.endingSura;
          sura++) {
        if (sura == verseRange.startSura) {
          List<Verse> list = List.empty(growable: true);

          for (var ayah = verseRange.startAyah;
              ayah <= getNumberOfAyahs(verseRange.startSura);
              ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }

          SuraVerses suraVerses =
              SuraVerses(suraId: verseRange.startSura, verses: list);
          result.add(suraVerses);
        } else if (sura == verseRange.endingSura) {
          List<Verse> list = List.empty(growable: true);

          for (var ayah = 1; ayah <= verseRange.endingAyah; ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }
          SuraVerses suraVerses = SuraVerses(suraId: sura, verses: list);
          result.add(suraVerses);
        } else {
          List<Verse> list = List.empty(growable: true);

          for (var ayah = 1; ayah <= getNumberOfAyahs(sura); ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }
          SuraVerses suraVerses = SuraVerses(suraId: sura, verses: list);
          result.add(suraVerses);
        }
      }
    }
    return result;
  }

  List<Verse> verseRangeForPage(int page) {
    List<Verse> list = List.empty(growable: true);
    VerseRange verseRange = getVerseRangeForPage(page);
    final suras = getListOfSurahWithStartingOnPage(page);
    if (suras.length == 1) {
      for (var i = 1; i <= verseRange.versesInRange; i++) {
        final verse = Verse(suraId: verseRange.startSura, ayahId: i);
        list.add(verse);
      }
    } else {
      for (var sura = verseRange.startSura;
          sura <= verseRange.endingSura;
          sura++) {
        if (sura == verseRange.startSura) {
          for (var ayah = verseRange.startAyah;
              ayah <= getNumberOfAyahs(verseRange.startSura);
              ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }
        } else if (sura == verseRange.endingSura) {
          for (var ayah = 1; ayah <= verseRange.endingAyah; ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }
        } else {
          for (var ayah = 1; ayah <= getNumberOfAyahs(sura); ayah++) {
            final verse = Verse(suraId: sura, ayahId: ayah);
            list.add(verse);
          }
        }
      }
    }
    return list;
  }

  int getStartingPageForJuz(int juz) {
    return _juzPageStart[juz - 1];
  }

  int getPageNumberForSura(int sura) {
    return _suraPageStart[sura - 1];
  }

  int getSuraNumberFromPage(int page) {
    var sura = -1;
    for (int i = 0; i < QuranConstants.NUMBER_OF_SURAS; i++) {
      //for (i in 0 until QuranConstants.NUMBER_OF_SURAS) {
      if (_suraPageStart[i] == page) {
        sura = i + 1;
        break;
      } else if (_suraPageStart[i] > page) {
        sura = i;
        break;
      }
    }
    return sura;
  }

  List<int> getListOfSurahWithStartingOnPage(int page) {
    final startIndex = _pageSuraStart[page - 1] - 1;
    List<int> result = List.empty(growable: true);
    for (int i = startIndex; i < QuranConstants.NUMBER_OF_SURAS; i++) {
      //for (i in startIndex until NUMBER_OF_SURAS) {
      if (_suraPageStart[i] == page) {
        result.add(i + 1);
      } else if (_suraPageStart[i] > page) break;
    }
    return result;
  }

  VerseRange getVerseRangeForPage(int page) {
    final result = getPageBounds(page);
    final versesInRange = 1 +
        (getAyahId(result[0], result[1]) - getAyahId(result[2], result[3]))
            .abs();
    return VerseRange(
        result[0], result[1], result[2], result[3], versesInRange);
  }

  int getFirstAyahOnPage(int page) {
    return _pageAyahStart[page - 1];
  }

  List<int> getPageBounds(int inputPage) {
    int page = inputPage;
    if (inputPage > numberOfPages) {
      page = numberOfPages;
    }
    if (inputPage < 1) {
      page = 1;
    }

    final bounds = List.filled(4, 0);
    bounds[0] = _pageSuraStart[page - 1];
    bounds[1] = _pageAyahStart[page - 1];
    if (page == numberOfPages) {
      bounds[2] = QuranConstants.LAST_SURA;
      bounds[3] = 6;
    } else {
      final nextPageSura = _pageSuraStart[page];
      final nextPageAyah = _pageAyahStart[page];
      if (nextPageSura == bounds[0]) {
        bounds[2] = bounds[0];
        bounds[3] = nextPageAyah - 1;
      } else {
        if (nextPageAyah > 1) {
          bounds[2] = nextPageSura;
          bounds[3] = nextPageAyah - 1;
        } else {
          bounds[2] = nextPageSura - 1;
          bounds[3] = _suraNumAyahs[bounds[2] - 1];
        }
      }
    }
    return bounds;
  }

  int getSuraOnPage(int page) {
    return _pageSuraStart[page - 1];
  }

  int getJuzFromPage(int page) {
    for (var i = 0; i < _juzPageStart.length; i++) {
//for (i in juzPageStart.indices) {
      if (_juzPageStart[i] > page) {
        return i;
      } else if (_juzPageStart[i] == page) {
        return i + 1;
      }
    }
    return 30;
  }

  int getRub3FromPage(int page) {
    if (page > numberOfPages || page < 1) {
      return -1;
    } else {
      return _pageRub3Start[page - 1];
    }
  }

  int getPageFromSuraAyah(int sura, int ayah) {
// basic bounds checking
//final currentAyah = if (ayah == 0) 1 else ayah;
    int currentAyah = ayah;
    if (ayah == 0) {
      currentAyah = 1;
    }
    if (sura < 1 ||
        sura > QuranConstants.NUMBER_OF_SURAS ||
        currentAyah < QuranConstants.MIN_AYAH ||
        currentAyah > QuranConstants.MAX_AYAH) {
      return -1;
    }

// what page does the sura start on?
    var index = _suraPageStart[sura - 1] - 1;
    while (index < numberOfPages) {
// what's the first sura in that page?
      final ss = _pageSuraStart[index];

// if we've passed the sura, return the previous page
// or, if we're at the same sura and passed the ayah
      if (ss > sura || ss == sura && _pageAyahStart[index] > currentAyah) {
        break;
      }

// otherwise, look at the next page
      index++;
    }
    return index;
  }

  int getAyahId(int sura, int ayah) {
    var ayahId = 0;
    for (var i = 0; i < sura - 1; i++) {
      ayahId += _suraNumAyahs[i];
    }
    ayahId += ayah;
    return ayahId;
  }

  int getNumberOfAyahs(int sura) {
    if (sura < 1 || sura > QuranConstants.NUMBER_OF_SURAS) {
      return -1;
    } else {
      return _suraNumAyahs[sura - 1];
    }
  }

  int getPageFromPosition(int position, {bool isDualPagesVisible = false}) {
    if (isDualPagesVisible) {
      return ((numberOfPagesDual - position) * 2).toInt();
    } else {
      return numberOfPages - position;
    }
  }

  int getPositionFromPage(int page, {bool isDualPagesVisible = false}) {
    if (isDualPagesVisible) {
      int pageToUse = page;
      //val pageToUse = if (page % 2 != 0) { page + 1 } else { page }
      if (page % 2 != 0) {
        pageToUse = page + 1;
      }
      return (numberOfPagesDual - pageToUse / 2).toInt();
    } else {
      return numberOfPages - page;
    }
  }

  /**
   * Gets the juz' that should be printed at the top of the page
   * This may be different than the actual juz' for the page (for example, juz' 7 starts at page
   * 121, but despite this, the title of the page is juz' 6).
   *
   * @param page the page
   * @return the display juz' display string for the page
   */
  int getJuzForDisplayFromPage(int page) {
    final actualJuz = getJuzFromPage(page);
    final overriddenJuz = _juzPageOverride[page];
    if (overriddenJuz != null) {
      return overriddenJuz;
    }
    return actualJuz;
  }

  SuraAyah getSuraAyahFromAyahId(int ayahId) {
    var sura = 0;
    var ayahIdentifier = ayahId;
    while (ayahIdentifier > _suraNumAyahs[sura]) {
      ayahIdentifier -= _suraNumAyahs[sura++];
    }
    return SuraAyah(sura + 1, ayahIdentifier);
  }

  List<int> getQuarterByIndex(int quarter) {
    return _quarters[quarter];
  }

  int getJuzFromSuraAyah(int sura, int ayah, int juz) {
    if (juz == 30) {
      return juz;
    }

// get the starting point of the next juz'
    final lastQuarter = _quarters[juz * 8];
// if we're after that starting point, return juz + 1
    if (sura > lastQuarter[0] ||
        lastQuarter[0] == sura && ayah >= lastQuarter[1]) {
      return juz + 1;
    } else {
// otherwise just return this juz
      return juz;
    }
  }

  bool isMakki(int sura) {
    return _suraIsMakki[sura - 1];
  }
}
