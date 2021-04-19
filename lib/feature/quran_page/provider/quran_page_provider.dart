import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/common/storage/provider/pref_provider.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:quran_reader/feature/quran_page/provider/quran_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

final quranPageProvider =
    StateNotifierProvider<QuranPageNotifier, QuranPageState>((ref) {
  final prefService = ref.watch(prefServiceProvider);
  final lastReadPage = prefService.lastReadPage();
  QuranPageState state = QuranPageState.initial();
  if (lastReadPage != null) {
    state = QuranPageState.loaded(lastReadPage);
  }
  return QuranPageNotifier(state, ref.watch(quranInfoProvider), prefService);
});

class QuranPageNotifier extends StateNotifier<QuranPageState> {
  final QuranInfoRepository quranInfoRepository;
  final PrefService prefService;
  QuranPageNotifier(
      QuranPageState quranPageState, this.quranInfoRepository, this.prefService)
      : super(quranPageState) {
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  _init() async {
    state.maybeWhen(
        initial: () async {
          final lastReadPage = prefService.lastReadPage();
          if (lastReadPage != null) {
            state = QuranPageState.loaded(lastReadPage);
          } else {
            loadPage(quranInfoRepository.startPage);
          }
        },
        orElse: () {});
  }

  _saveToPref() {
    state.maybeWhen(
        loaded: (value) async {
          prefService.setLastReadPage(value);
        },
        orElse: () {});
  }

  loadPage(int pageNumber) async {
    final page = await _fetchQuranPage(pageNumber);
    if (page != null) {
      state = QuranPageState.loaded(page);
      _saveToPref();
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
          pageNumber: page,
          imageUrl:
              'assets/images/1024/page${page.toString().padLeft(3, '0')}.png');
      quranPage.suraVerses = quranInfoRepository.suraVerseForPage(page);
      return quranPage;
    }
    return null;
  }
}
