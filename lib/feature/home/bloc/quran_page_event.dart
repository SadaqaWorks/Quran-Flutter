import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowBackwardPage extends QuranPageEvent {}

class ShowForwardPage extends QuranPageEvent {}

class JumpToPage extends QuranPageEvent {
  final int pageNumber;

  JumpToPage({@required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
