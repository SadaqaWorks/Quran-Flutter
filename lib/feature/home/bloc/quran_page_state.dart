import 'package:equatable/equatable.dart';
import 'package:quran/feature/home/model/quran_page.dart';

abstract class QuranPageState extends Equatable {
  const QuranPageState();
}

class QuranPageInitial extends QuranPageState {
  @override
  List<Object> get props => null;
}

class QuranPageForward extends QuranPageState {
  @override
  List<Object> get props => null;
}

class QuranPageBackward extends QuranPageState {
  @override
  List<Object> get props => null;
}

class QuranPageLoaded extends QuranPageState {
  final QuranPage quranPage;

  const QuranPageLoaded({this.quranPage});

  QuranPageLoaded copyWith({QuranPage quranPage}) {
    return QuranPageLoaded(quranPage: quranPage ?? this.quranPage);
  }

  @override
  List<Object> get props => [quranPage];

  @override
  String toString() => 'PostLoaded { posts: ${quranPage.page} }';
}
