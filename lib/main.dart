import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/app/app.dart';
import 'package:quran/common/database/ayah_info_service.dart';
import 'dart:convert';
import 'dart:io';
import 'package:sqflite/sqflite.dart';

void main() => start();

void start() async {

  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();



  final ayahInfoService = await AyahInfoService.create();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
      runApp(new App(ayahInfoService: ayahInfoService));
  });

}
