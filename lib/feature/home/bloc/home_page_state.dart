import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => [];
}

class HomePageStateInitial extends HomePageState {
  HomePageStateInitial();

  @override
  List<Object?> get props => [];
}

class HomePageStateShowInfo extends HomePageState {
  HomePageStateShowInfo();

  @override
  List<Object> get props => [];
}

class HomePageStateShowFullNavigator extends HomePageState {
  HomePageStateShowFullNavigator();

  @override
  List<Object> get props => [];
}
