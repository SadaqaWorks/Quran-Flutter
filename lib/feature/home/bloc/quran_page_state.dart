import 'package:meta/meta.dart';
import 'package:quran_reader/feature/home/model/quran_page.dart';

abstract class QuranPageState {
  const QuranPageState();
}

class QuranPageInitial extends QuranPageState {
  @override
  List<Object> get props => null;
}

class QuranPageLoaded extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageLoaded({@required this.quranPage});

  QuranPageLoaded copyWith({QuranPage quranPage}) {
    return QuranPageLoaded(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${quranPage.page} }';
}

class QuranPageJumpedTo extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageJumpedTo({@required this.quranPage});

  QuranPageJumpedTo copyWith({QuranPage quranPage}) {
    return QuranPageJumpedTo(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'QuranPageJumpedTo { page: ${quranPage.page} }';
}
