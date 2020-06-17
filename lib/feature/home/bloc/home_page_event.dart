import 'package:meta/meta.dart';

@immutable
abstract class HomePageEvent {
  HomePageEvent();
}

class HomePageViewNormal extends HomePageEvent {}

class HomePageViewTapped extends HomePageEvent {}

class HomePageShowNavigatorTapped extends HomePageEvent {}

class HomePageHideNavigatorTapped extends HomePageEvent {}
