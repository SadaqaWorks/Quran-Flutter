import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

@immutable
abstract class HomePageEvent extends Equatable {
  const HomePageEvent();
  @override
  List<Object> get props => [];
}

class HomePageViewTapped extends HomePageEvent {}

class HomePageShowNavigatorTapped extends HomePageEvent {
  final QuranPage quranPage;

  HomePageShowNavigatorTapped({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class HomePageHideNavigatorTapped extends HomePageEvent {
  final QuranPage quranPage;

  HomePageHideNavigatorTapped({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}
