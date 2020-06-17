import 'package:meta/meta.dart';

@immutable
abstract class HomePageState {}

class HomePageInitialView extends HomePageState {}

class HomePageShowNavigatorInitialView extends HomePageState {}
class HomePageShowNavigatorView extends HomePageState {}

class HomePageHideView extends HomePageState {}
