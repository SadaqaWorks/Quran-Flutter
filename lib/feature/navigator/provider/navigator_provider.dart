import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/quran/model/sura.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/feature/home/provider/home_page_notifier.dart';
import 'package:quran_reader/feature/quran_page/provider/index.dart';
import 'package:state_notifier/state_notifier.dart';

import 'navigator_view_state.dart';

enum NavigatorType { sura, juz, page }

final navigatorViewProvider = StateNotifierProvider.autoDispose<
    NavigatorViewNotifier, NavigatorViewState>((ref) {
  late int currentlySelectedPageNumber;
  ref.watch(quranPageProvider).maybeWhen(loaded: (value) {
    currentlySelectedPageNumber = value.pageNumber;
  }, orElse: () {
    //currentlySelectedPageNumber = 0;
  });
  final quranInfoRepository = ref.watch(quranInfoProvider);

  return NavigatorViewNotifier(
      ref.read,
      quranInfoRepository,
      currentlySelectedPageNumber,
      SuraList.list,
      List.generate(quranInfoRepository.numberOfPages, (i) => i),
      List.generate(30, (i) => i++));
});

class NavigatorViewNotifier extends StateNotifier<NavigatorViewState> {
  final QuranInfoRepository quranInfoRepository;
  int currentlySelectedPageNumber;
  final Reader read;

  int? _newSelectedPageNumber;
  final List<Sura> suraList;
  final List<int> juzList;
  final List<int> pageList;
  NavigatorType _selectedNavigatorType = NavigatorType.sura;

  NavigatorViewNotifier(
      this.read,
      this.quranInfoRepository,
      this.currentlySelectedPageNumber,
      this.suraList,
      this.pageList,
      this.juzList)
      : super(NavigatorViewState.loadSuraList(
            suraList,
            (quranInfoRepository
                    .getSuraNumberFromPage(currentlySelectedPageNumber) -
                1))) {}

  _init() {
    state = NavigatorViewState.loadSuraList(
        suraList,
        (quranInfoRepository
                .getSuraNumberFromPage(currentlySelectedPageNumber) -
            1));
  }

  navigatorSelected(NavigatorType type) {
    _selectedNavigatorType = type;
    if (_selectedNavigatorType == NavigatorType.sura) {
      state = NavigatorViewState.loadSuraList(
          suraList,
          (quranInfoRepository
                  .getSuraNumberFromPage(currentlySelectedPageNumber) -
              1));
    }
    if (_selectedNavigatorType == NavigatorType.juz) {
      state = NavigatorViewState.loadJuzList(
          juzList,
          (quranInfoRepository.getJuzFromPage(currentlySelectedPageNumber) -
              1));
    }
    if (_selectedNavigatorType == NavigatorType.page) {
      state = NavigatorViewState.loadPageList(
          pageList, currentlySelectedPageNumber - 1);
    }
  }

  suraSelected(int index) {
    print('suraSelected 1 ${index} ${currentlySelectedPageNumber}');
    currentlySelectedPageNumber =
        quranInfoRepository.getPageNumberForSura(suraList[index].id);
    print('suraSelected 2 ${index} ${currentlySelectedPageNumber}');
  }

  juzSelected(int index) {
    print('juzSelected 1 ${index} ${currentlySelectedPageNumber}');

    currentlySelectedPageNumber =
        quranInfoRepository.getStartingPageForJuz(index + 1);
    print('juzSelected 2 ${index} ${currentlySelectedPageNumber}');
  }

  pageSelected(int index) {
    currentlySelectedPageNumber = index + 1;
  }

  confirmSelected() {
    print('confirmSelected 2 ${currentlySelectedPageNumber}');

    //if (currentlySelectedPageNumber != null) {
    read(quranPageProvider.notifier).loadPage(currentlySelectedPageNumber);
    read(homePageProvider.notifier).hideNavigator();
    //}
  }
}
