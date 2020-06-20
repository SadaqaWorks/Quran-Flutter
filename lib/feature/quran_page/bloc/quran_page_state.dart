import 'package:meta/meta.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

abstract class QuranPageState {
  const QuranPageState();
}

class InitialQuranPageState extends QuranPageState {
  @override
  List<Object> get props => null;
}

class QuranPageLoadedState extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageLoadedState({@required this.quranPage});

  QuranPageLoadedState copyWith({QuranPage quranPage}) {
    return QuranPageLoadedState(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${quranPage.page} }';
}

class QuranPageJumpedToState extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageJumpedToState({@required this.quranPage});

  QuranPageJumpedToState copyWith({QuranPage quranPage}) {
    return QuranPageJumpedToState(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageJumpedTo { page: ${quranPage.page} }';
}
