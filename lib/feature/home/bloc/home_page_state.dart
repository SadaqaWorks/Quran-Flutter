import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

@immutable
abstract class HomePageState extends Equatable{
  const HomePageState();
  @override
  List<Object> get props => [];
}

//class HomePageInitialView extends HomePageState {
//  final QuranPage quranPage;
//
//  HomePageInitialView({@required this.quranPage});
//
//  @override
//  List<Object> get props => [quranPage];
//}

class HomePageShowNavigatorInitialView extends HomePageState {
  final QuranPage quranPage;

  HomePageShowNavigatorInitialView({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class HomePageShowNavigatorView extends HomePageState {
  final QuranPage quranPage;

  HomePageShowNavigatorView({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class HomePageHideView extends HomePageState {
  final QuranPage quranPage;

  HomePageHideView({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}
