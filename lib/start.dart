import 'dart:io' as io;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/common/quran/quran_info.dart';
import 'package:quran_reader/common/resource/manager/database_manager.dart';
import 'package:quran_reader/common/sharedpreference/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app.dart';
import 'common/quran/madani_data_source.dart';

void start() async {
  Future<io.Directory> _getTemporaryDirectory() async {
    const MethodChannel _channel =
        MethodChannel('plugins.flutter.io/path_provider');
    final String path =
        (await _channel.invokeMethod<String>('getTemporaryDirectory'))!;
    return io.Directory(path);
  }

  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  // final isarResources = await openIsar(name: Databases.resources);
  // final isarUser = await openIsar(name: Databases.user);

  //quranInfoProvider.
  final info = QuranInfoRepository(QuranDataSourceMadani());
  print(
      'QuranDataSourceMadani\n getListOfSurahWithStartingOnPage ${info.getListOfSurahWithStartingOnPage(2)}\n getSuraNumberFromPage ${info.getSuraNumberFromPage(2)}\n getFirstAyahOnPage: ${info.getFirstAyahOnPage(2)}\n getPageBounds: ${info.getPageBounds(2)}\n getVerseRangeForPage: ${info.getVerseRangeForPage(2)}  \n getPositionFromPage: ${info.getPositionFromPage(2)}\n getSuraNumberFromPage ${info.getSuraNumberFromPage(2)}\n');
  print('~~~~~~~~~~~~~~~~~~~');
  print(
      'QuranDataSourceMadani\n getListOfSurahWithStartingOnPage ${info.getListOfSurahWithStartingOnPage(603)}\n getSuraNumberFromPage ${info.getSuraNumberFromPage(603)}\n getFirstAyahOnPage: ${info.getFirstAyahOnPage(603)}\n getPageBounds: ${info.getPageBounds(603)}\n getVerseRangeForPage: ${info.getVerseRangeForPage(603)}  \n getPositionFromPage: ${info.getPositionFromPage(603)}\n getSuraNumberFromPage ${info.getSuraNumberFromPage(603)}\n');
  print('~~~~~~~~~~~~~~~~~~~');
  for (var item in info.verseRangeForPage(2)) {
    //print("verse: $item ");
  }
  print('~~~~~~~~~~~~~~~~~~~');
  for (var item in info.suraVerseForPage(603)) {
    print("verse: $item ");
  }
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await (_getTemporaryDirectory()),
  );

  await DatabaseManager.init();

  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        //isarResourceProvider.overrideWithValue(isarResources),
        //isarUserProvider.overrideWithValue(isarUser)
      ],
      child: App(),
    ));
  });
}
