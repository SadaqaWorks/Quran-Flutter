import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class HomePageState extends Equatable{
  const HomePageState();
  @override
  List<Object> get props => [];
}

class InitialNavigatorViewState  extends HomePageState {
  final QuranPage quranPage;

  InitialNavigatorViewState({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class ShowNavigatorViewState extends HomePageState {
  final QuranPage quranPage;

  ShowNavigatorViewState({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class HideNavigatorViewState extends HomePageState {
  final QuranPage quranPage;

  HideNavigatorViewState({@required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}
