import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:quran/common/bloc/simple_bloc_delegate.dart';
import 'package:quran/app/app.dart';


void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();

  runApp(App());
}


