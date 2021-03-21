import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/app/app.dart';
import 'package:quran_reader/common/database/ayah_info_service.dart';

void main() => start();

void start() async {
  Future<Directory> _getTemporaryDirectory() async {
    const MethodChannel _channel =
        MethodChannel('plugins.flutter.io/path_provider');
    final String path =
        (await _channel.invokeMethod<String>('getTemporaryDirectory'))!;
    return Directory(path);
  }

  WidgetsFlutterBinding.ensureInitialized();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await (_getTemporaryDirectory()),
  );

  //await dotenv.load(fileName: ".env");

  final ayahInfoService = await AyahInfoService.create();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(new App(ayahInfoService: ayahInfoService));
  });
}
