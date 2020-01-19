import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:quran/app/app.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();

  runApp(App());
}
