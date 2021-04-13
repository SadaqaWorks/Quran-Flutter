import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:quran_reader/common/quran/model/sura.dart';

part 'navigator_view_state.freezed.dart';

@freezed
class NavigatorViewState with _$NavigatorViewState {
  const factory NavigatorViewState.initial() = _Initial;

  const factory NavigatorViewState.loadSuraList(
      List<Sura> list, int selectedIndex) = _LoadSuraList;

  const factory NavigatorViewState.loadJuzList(
      List<int> list, int selectedIndex) = _LoadJuzList;

  const factory NavigatorViewState.loadPageList(
      List<int> list, int selectedIndex) = _LoadPageList;

  const factory NavigatorViewState.showFullNavigator() = _ShowFullNavigator;
}
