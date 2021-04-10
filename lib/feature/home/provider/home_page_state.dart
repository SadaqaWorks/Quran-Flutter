import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;

  const factory HomePageState.showInfo() = _ShowInfo;

  const factory HomePageState.showFullNavigator() = _ShowFullNavigator;
}
