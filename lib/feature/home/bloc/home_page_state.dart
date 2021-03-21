import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => [];
}

class InitialHomeViewState extends HomePageState {
  InitialHomeViewState();

  @override
  List<Object?> get props => [];
}

class ShowNavigatorViewState extends HomePageState {
  ShowNavigatorViewState();

  @override
  List<Object> get props => [];
}

class HideNavigatorViewState extends HomePageState {
  HideNavigatorViewState();

  @override
  List<Object?> get props => [];
}
