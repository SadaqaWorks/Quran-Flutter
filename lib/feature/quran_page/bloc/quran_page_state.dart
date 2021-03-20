import 'package:quran_reader/feature/quran_page/model/models.dart';

abstract class QuranPageState {
  const QuranPageState();

  @override
  List<Object>? get props => [];

  @override
  String toString() => 'QuranPageLoaded }';
}

class InitialQuranPageState extends QuranPageState {
  const InitialQuranPageState() : super();

  @override
  List<Object> get props => [];
}

class QuranPageLoadedState extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageLoadedState({required this.quranPage}) : super();

  QuranPageLoadedState copyWith({QuranPage? quranPage}) {
    return QuranPageLoadedState(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${quranPage.pageNumber} }';
}

class QuranPageJumpedToState extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageJumpedToState({required this.quranPage}) : super();

  QuranPageJumpedToState copyWith({QuranPage? quranPage}) {
    return QuranPageJumpedToState(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageJumpedTo { page: ${quranPage.pageNumber} }';
}
