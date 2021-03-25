import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'app/app.dart';

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

  //final ayahInfoService = await AyahInfoRepository.create();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(App());
  });
}
