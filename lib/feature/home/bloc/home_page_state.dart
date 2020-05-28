import 'package:meta/meta.dart';

@immutable
abstract class HomePageState {}

class HomePageInitialView extends HomePageState {}

class HomePageShowView extends HomePageState {}

class HomePageHideView extends HomePageState {}

class HomePageShowSideView extends HomePageState {}
