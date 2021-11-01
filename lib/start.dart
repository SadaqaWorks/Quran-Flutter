import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/storage/provider/pref_provider.dart';
import 'package:quran_reader/common/storage/repository/storage_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void start() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  await StorageManager.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(
      overrides: [
        prefServiceProvider.overrideWithValue(PrefService(sharedPreferences)),
      ],
      child: App(),
    ));
  });
}
