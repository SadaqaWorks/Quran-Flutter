import 'package:equatable/equatable.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageViewTapped extends HomePageEvent {}

class HomePageMenuTapped extends HomePageEvent {}
