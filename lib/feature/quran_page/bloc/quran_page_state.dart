import 'package:quran_reader/feature/quran_page/model/models.dart';

abstract class QuranPageState {
  final QuranPage quranPage;

  const QuranPageState({required this.quranPage});

  @override
  List<Object>? get props => [quranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${quranPage.pageNumber} }';
}

class InitialQuranPageState extends QuranPageState {
  final QuranPage quranPage;
  const InitialQuranPageState({required this.quranPage})
      : super(quranPage: quranPage);
  @override
  List<Object> get props => [quranPage];
}

class QuranPageLoadedState extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageLoadedState({required this.quranPage})
      : super(quranPage: quranPage);

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

  const QuranPageJumpedToState({required this.quranPage})
      : super(quranPage: quranPage);

  QuranPageJumpedToState copyWith({QuranPage? quranPage}) {
    return QuranPageJumpedToState(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageJumpedTo { page: ${quranPage.pageNumber} }';
}
