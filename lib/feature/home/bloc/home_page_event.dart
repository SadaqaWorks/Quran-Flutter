import 'package:equatable/equatable.dart';
import 'package:quran/feature/home/model/quran_page.dart';
import 'package:meta/meta.dart';

abstract class HomePageEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class HomePageViewTapped extends HomePageEvent {}
class HomePageMenuTapped extends HomePageEvent {}

