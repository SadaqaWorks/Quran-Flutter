import 'package:equatable/equatable.dart';
import 'package:quran/feature/home/model/quran_page.dart';

abstract class QuranPageState extends Equatable {
  const QuranPageState();

  @override
  List<Object> get props => [];
}

class QuranPageInitial extends QuranPageState {}

class QuranPageForward extends QuranPageState {}

class QuranPageBackward extends QuranPageState {}

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
