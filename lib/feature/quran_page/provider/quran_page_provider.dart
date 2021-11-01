import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/common/storage/provider/pref_provider.dart';
import 'package:quran_reader/feature/quran_page/provider/quran_page_state.dart';
import 'package:state_notifier/state_notifier.dart';

import 'quran_page_repository.dart';

final quranPageProvider =
    StateNotifierProvider<QuranPageNotifier, QuranPageState>((ref) {
  return QuranPageNotifier(ref.watch(quranInfoProvider),
      ref.watch(prefServiceProvider), ref.watch(quranPageRepositoryProvider));
});

class QuranPageNotifier extends StateNotifier<QuranPageState> {
  final PrefService prefService;
  final QuranInfoRepository quranInfoRepository;
  final QuranPageRepository quranPageRepository;

  QuranPageNotifier(
      this.quranInfoRepository, this.prefService, this.quranPageRepository)
      : super(QuranPageState.loading()) {
    _init();
  }

  @override
  void dispose() {
    quranPageRepository.dispose();
    super.dispose();
  }

  _init() async {
    state.maybeWhen(
        loading: () async {
          final lastReadPage = prefService.lastReadPage();
          if (lastReadPage != null) {
            loadPage(lastReadPage);
          } else {
            loadPage(quranInfoRepository.startPage);
          }
        },
        orElse: () {});
  }

  _saveToPref() {
    state.maybeWhen(
        loaded: (value) async {
          prefService.setLastReadPage(value.pageNumber);
        },
        orElse: () {});
  }

  loadPage(int pageNumber) async {
    state = QuranPageState.loading();
    quranPageRepository.fetchQuranPage(pageNumber).listen((value) {
      state = value;
    });
    _saveToPref();
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
}
