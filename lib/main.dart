import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/common/resource/hive/hive_manager.dart';

import 'app/app.dart';

void main() => start();

void start() async {
  Future<io.Directory> _getTemporaryDirectory() async {
    const MethodChannel _channel =
        MethodChannel('plugins.flutter.io/path_provider');
    final String path =
        (await _channel.invokeMethod<String>('getTemporaryDirectory'))!;
    return io.Directory(path);
  }

  WidgetsFlutterBinding.ensureInitialized();
  //final sharedPreferences = await SharedPreferences.getInstance();

  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await (_getTemporaryDirectory()),
  );

  await HiveManager.initialize();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(
      overrides: [
        //sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: App(),
    ));
  });
}
