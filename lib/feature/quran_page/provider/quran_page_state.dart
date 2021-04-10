import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

part 'quran_page_state.freezed.dart';

@freezed
class QuranPageState with _$QuranPageState {
  const factory QuranPageState.initial() = _Initial;

  const factory QuranPageState.loaded(QuranPage page) = _Loaded;
}
