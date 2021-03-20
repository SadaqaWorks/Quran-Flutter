import 'package:equatable/equatable.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuranPageStartEvent extends QuranPageEvent {}

class LoadPageEvent extends QuranPageEvent {
  final int pageNumber;

  LoadPageEvent({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}

class JumpToPageEvent extends QuranPageEvent {
  final int pageNumber;

  JumpToPageEvent({required this.pageNumber});

  @override
  List<Object?> get props => [pageNumber];
}
