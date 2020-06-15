import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class AppConfigState extends Equatable {
  const AppConfigState({@required this.theme, @required this.locale});

  final ThemeData theme;
  final Locale locale;

  @override
  List<Object> get props => [theme, locale];
}
