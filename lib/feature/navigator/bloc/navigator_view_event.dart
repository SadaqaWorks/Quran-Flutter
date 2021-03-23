import 'package:meta/meta.dart';
import 'package:quran_reader/feature/sura/model/models.dart';

@immutable
abstract class NavigatorViewEvent {
  const NavigatorViewEvent();

  @override
  List<Object> get props => [];
}

class NavigatorViewEventCancel extends NavigatorViewEvent {}

class NavigatorViewEventSelectSura extends NavigatorViewEvent {
  final Sura sura;

  NavigatorViewEventSelectSura({required this.sura});

  @override
  List<Object> get props => [sura];
}

class NavigatorViewEventSelectPage extends NavigatorViewEvent {
  final int pageNumber;

  NavigatorViewEventSelectPage({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}

class NavigatorViewEventSelectJuzz extends NavigatorViewEvent {
  final int juzzNumber;

  NavigatorViewEventSelectJuzz({required this.juzzNumber});

  @override
  List<Object> get props => [juzzNumber];
}

class NavigatorViewEventConfirm extends NavigatorViewEvent {}
