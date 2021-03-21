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
  final QuranPage firstQuranPage;
  final QuranPage? secondQuranPage;

  const QuranPageLoadedState(
      {required this.firstQuranPage, this.secondQuranPage})
      : super();

  QuranPageLoadedState copyWith(
      {QuranPage? firstQuranPage, QuranPage? secondQuranPage}) {
    return QuranPageLoadedState(
        firstQuranPage: firstQuranPage ?? this.firstQuranPage,
        secondQuranPage: secondQuranPage ?? this.secondQuranPage);
  }

  @override
  List<Object> get props => [firstQuranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${firstQuranPage.pageNumber} }';
}

// class QuranPageJumpedToState extends QuranPageState {
//   final QuranPage quranPage;
//
//   const QuranPageJumpedToState({required this.quranPage}) : super();
//
//   QuranPageJumpedToState copyWith({QuranPage? quranPage}) {
//     return QuranPageJumpedToState(quranPage: quranPage ?? this.quranPage);
//   }
//
//   @override
//   List<Object> get props => [quranPage];
//
//   @override
//   String toString() => 'QuranPageJumpedTo { page: ${quranPage.pageNumber} }';
// }
