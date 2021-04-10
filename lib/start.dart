import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/resource/manager/database_manager.dart';
import 'package:quran_reader/common/sharedpreference/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';

void start() async {
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  // final isarResources = await openIsar(name: Databases.resources);
  // final isarUser = await openIsar(name: Databases.user);

  await DatabaseManager.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(
      overrides: [
        sharedPreferencesServiceProvider
            .overrideWithValue(SharedPreferencesService(sharedPreferences)),
        //isarResourceProvider.overrideWithValue(isarResources),
        //isarUserProvider.overrideWithValue(isarUser)
      ],
      child: App(),
    ));
  });
}
