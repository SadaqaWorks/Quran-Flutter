import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


@immutable
abstract class HomePageEvent  {
  HomePageEvent();
}

class HomePageViewNormal extends HomePageEvent {

}

class HomePageViewTapped extends HomePageEvent {

}

class HomePageMenuTapped extends HomePageEvent {

}
