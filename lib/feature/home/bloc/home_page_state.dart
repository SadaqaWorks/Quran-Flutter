import 'package:equatable/equatable.dart';
import 'package:quran/feature/home/model/quran_page.dart';

abstract class HomePageState extends Equatable {

  const HomePageState();

  @override
  List<Object> get props => [];
}

class HomePageInitial extends HomePageState {
}

class HomePageShowView extends HomePageState {
}
