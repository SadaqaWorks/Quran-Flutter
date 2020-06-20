part of 'navigator_bloc.dart';

@immutable
abstract class NavigatorState {
  const NavigatorState();
  @override
  List<Object> get props => [];
}

class InitialNavigatorState extends NavigatorState {}