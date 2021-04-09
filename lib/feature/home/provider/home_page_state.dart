import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState.initial() = _Initial;

  const factory HomePageState.showInfo() = _ShowInfo;

  const factory HomePageState.showFullNavigator() = _ShowFullNavigator;
}

// @immutable
// abstract class HomePageState extends Equatable {
//   const HomePageState();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class HomePageStateInitial extends HomePageState {
//   HomePageStateInitial();
//
//   @override
//   List<Object?> get props => [];
// }
//
// class HomePageStateShowInfo extends HomePageState {
//   HomePageStateShowInfo();
//
//   @override
//   List<Object> get props => [];
// }
//
// class HomePageStateShowFullNavigator extends HomePageState {
//   HomePageStateShowFullNavigator();
//
//   @override
//   List<Object> get props => [];
// }
