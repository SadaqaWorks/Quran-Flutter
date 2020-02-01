import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  HomePageEvent();
}

class HomePageViewNormal extends HomePageEvent {
  @override
  List<Object> get props => null;
}

class HomePageViewTapped extends HomePageEvent {
  @override
  List<Object> get props => null;
}

class HomePageMenuTapped extends HomePageEvent {
  @override
  List<Object> get props => null;
}
