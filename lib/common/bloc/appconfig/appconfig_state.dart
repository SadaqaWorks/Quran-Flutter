import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


@immutable
abstract class AppConfigState extends Equatable {
  const AppConfigState();

  @override
  List<Object> get props => [];
}

class AppConfigStateStarted extends AppConfigState {
  const AppConfigStateStarted({required this.theme, required this.locale});

  final ThemeData theme;
  final Locale locale;

  @override
  List<Object> get props => [theme, locale];
}
class AppConfigStateInitial extends AppConfigState {


  @override
  List<Object> get props => [];
}