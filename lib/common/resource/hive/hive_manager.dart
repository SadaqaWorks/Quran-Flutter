import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_reader/common/resource/model/resource.dart';
import 'package:quran_reader/common/resource/model/resources.dart';

class HiveManager {
  //current highest type ID 4
  static Future<void> initialize() async {
    await Hive.initFlutter('hive');
    _registerHiveAdapters();
    await Future.wait([
      Hive.openBox(HiveBoxes.resources),
      Hive.openBox(HiveBoxes.settings),
    ]);
  }

  static void _registerHiveAdapters() {
    Hive.registerAdapter(ResourceAdapter());
    Hive.registerAdapter(ResourcesAdapter());
    Hive.registerAdapter(ResourceTypeAdapter());
    Hive.registerAdapter(FileTypeAdapter());
  }

  static Future<void> clearBoxes() async {}
}

abstract class HiveBoxes {
  static const String credential = 'credential';
  static const String user = 'user';
  static const String resources = 'resources';
  static const String settings = 'settings';
}
