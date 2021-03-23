import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();

  @override
  List<Object?> get props => [];
}

class HomePageEventViewTap extends HomePageEvent {}

class HomePageShowNavigatorTappedEvent extends HomePageEvent {
  HomePageShowNavigatorTappedEvent();

  @override
  List<Object> get props => [];
}

class HomePageEventHideNavigatorTap extends HomePageEvent {
  HomePageEventHideNavigatorTap();

  @override
  List<Object?> get props => [];
}
