import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

part 'quran_page_state.freezed.dart';

@freezed
class QuranPageState with _$QuranPageState {
  //const factory QuranPageState.initial() = _Initial;
  const factory QuranPageState.loading() = _Loading;
  const factory QuranPageState.downloading() = _DownLoading;
  const factory QuranPageState.internetUnAvailable() = _InternetUnAvailable;
  const factory QuranPageState.loaded(QuranPage quranPage) = _Loaded;
}
