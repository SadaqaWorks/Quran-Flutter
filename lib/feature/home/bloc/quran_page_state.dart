import 'package:equatable/equatable.dart';
import 'package:quran/feature/home/model/quran_page.dart';
import 'package:meta/meta.dart';

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

class QuranJumpToPage extends QuranPageState {
  final int pageNumber;

  const QuranJumpToPage({@required this.pageNumber});

  QuranJumpToPage copyWith({QuranPage pageNumber}) {
    return QuranJumpToPage(pageNumber: pageNumber ?? this.pageNumber);
  }

  @override
  List<Object> get props => [pageNumber];

  @override
  String toString() => 'PostLoaded { posts: ${pageNumber} }';
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
  String toString() => 'PostLoaded { posts: ${quranPage.page} }';
}
