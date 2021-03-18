import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

@immutable
abstract class HomePageState extends Equatable {
  const HomePageState();

  @override
  List<Object?> get props => [];
}

class InitialHomeViewState extends HomePageState {
  final QuranPage? quranPage;

  InitialHomeViewState({required this.quranPage});

  @override
  List<Object?> get props => [quranPage];
}

class ShowNavigatorViewState extends HomePageState {
  final QuranPage quranPage;

  ShowNavigatorViewState({required this.quranPage});

  @override
  List<Object> get props => [quranPage];
}

class HideNavigatorViewState extends HomePageState {
  final QuranPage? quranPage;

  HideNavigatorViewState({required this.quranPage});

  @override
  List<Object?> get props => [quranPage];
}
