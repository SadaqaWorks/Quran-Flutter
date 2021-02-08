import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/app/app.dart';
import 'package:quran_reader/common/database/ayah_info_service.dart';

void main() => start();

void start() async {
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build();

  final ayahInfoService = await AyahInfoService.create();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new App(ayahInfoService: ayahInfoService));
  });
}
