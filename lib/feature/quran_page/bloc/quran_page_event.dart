import 'package:equatable/equatable.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class QuranPageEventLoad extends QuranPageEvent {
  final int pageNumber;

  QuranPageEventLoad({required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
