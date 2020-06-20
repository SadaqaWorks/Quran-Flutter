import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadPageEvent extends QuranPageEvent {
  final int pageNumber;

  LoadPageEvent({@required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}

class JumpToPageEvent extends QuranPageEvent {
  final int pageNumber;

  JumpToPageEvent({@required this.pageNumber});

  @override
  List<Object> get props => [pageNumber];
}
