import 'package:meta/meta.dart';
import 'package:quran_reader/feature/sura/model/models.dart';

@immutable
abstract class NavigatorViewState {
  const NavigatorViewState();

  @override
  List<Object> get props => [];
}

class InitialNavigatorViewState extends NavigatorViewState {}

class ShowSuraListNavigatorViewState extends NavigatorViewState {
  final List<Sura> suraList;

  ShowSuraListNavigatorViewState({@required this.suraList});

  @override
  List<Object> get props => [suraList];
}

class SuraSelectNavigatorViewState extends NavigatorViewState {
  final Sura sura;

  SuraSelectNavigatorViewState({@required this.sura});

  @override
  List<Object> get props => [sura];
}

class PageSelectNavigatorViewState extends NavigatorViewState {
  final int pageNumber;

  PageSelectNavigatorViewState({@required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}

class JuzzSelectNavigatorViewState extends NavigatorViewState {
  final int juzzNumber;

  JuzzSelectNavigatorViewState({@required this.juzzNumber});

  @override
  List<Object> get props => [juzzNumber];
}

class NavigatorViewConfirmState extends NavigatorViewState {
  final int pageNumber;

  NavigatorViewConfirmState({@required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
