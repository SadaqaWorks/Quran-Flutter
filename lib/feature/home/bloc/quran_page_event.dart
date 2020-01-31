import 'package:equatable/equatable.dart';

abstract class QuranPageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ShowBackwardPage extends QuranPageEvent {}

class ShowForwardPage extends QuranPageEvent {}
