import 'package:equatable/equatable.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowBackward extends QuranPageEvent {}

class ShowForward extends QuranPageEvent {}
