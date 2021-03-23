import 'package:quran_reader/feature/quran_page/model/models.dart';

abstract class QuranPageState {
  const QuranPageState();

  @override
  List<Object>? get props => [];

  @override
  String toString() => 'QuranPageLoaded }';
}

class QuranPageStateInitial extends QuranPageState {
  const QuranPageStateInitial() : super();

  @override
  List<Object> get props => [];
}

class QuranPageStateLoaded extends QuranPageState {
  final QuranPage firstQuranPage;
  final QuranPage? secondQuranPage;

  const QuranPageStateLoaded(
      {required this.firstQuranPage, this.secondQuranPage})
      : super();

  QuranPageStateLoaded copyWith(
      {QuranPage? firstQuranPage, QuranPage? secondQuranPage}) {
    return QuranPageStateLoaded(
        firstQuranPage: firstQuranPage ?? this.firstQuranPage,
        secondQuranPage: secondQuranPage ?? this.secondQuranPage);
  }

  @override
  List<Object> get props => [firstQuranPage];

  @override
  String toString() => 'QuranPageLoaded { page: ${firstQuranPage.pageNumber} }';
}
