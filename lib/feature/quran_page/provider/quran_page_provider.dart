import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:quran_reader/feature/quran_page/provider/quran_page_state.dart';

final quranPageProvider = StateNotifierProvider(
  (ref) => QuranPageNotifier(ref.watch(quranInfoProvider)),
);

class QuranPageNotifier extends StateNotifier<QuranPageState> {
  final QuranInfoRepository quranInfoRepository;

  QuranPageNotifier(this.quranInfoRepository)
      : super(QuranPageState.initial()) {
    _init();
  }

  _init() async {
    state.maybeWhen(
        initial: () async {
          loadPage(quranInfoRepository.startPage);
        },
        orElse: () {});
  }

  loadPage(int pageNumber) async {
    final page = await _fetchQuranPage(pageNumber);
    if (page != null) {
      state = QuranPageState.loaded(page);
    }
  }

  rightNavigation() async {
    state.maybeWhen(
        loaded: (value) async {
          loadPage(value.pageNumber + 1);
        },
        orElse: () {});
  }

  leftNavigation() async {
    state.maybeWhen(
        loaded: (value) async {
          loadPage(value.pageNumber - 1);
        },
        orElse: () {});
  }

  Future<QuranPage?> _fetchQuranPage(int page) async {
    if (page >= quranInfoRepository.startPage &&
        page <= quranInfoRepository.numberOfPages) {
      QuranPage quranPage = QuranPage(
          pageNumber: page, imageUrl: 'assets/images/quran/$page.png');

      //quranPage.quranPageInfoList = await ayahInfoRepository.getQuranPageInfoList(pageNumber: quranPage.pageNumber);
      return quranPage;
    }
    return null;
  }
}
