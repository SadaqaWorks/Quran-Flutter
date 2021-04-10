import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:quran_reader/common/model/resource/resource.dart';
import 'package:quran_reader/common/model/user/user.dart';

class StorageManager {
  //current highest type ID 4
  static Future<void> init() async {
    await Hive.initFlutter('hive');
    _registerHiveAdapters();
    await Future.wait([
      Hive.openBox(Databases.resources),
      Hive.openBox(Databases.settings),
    ]);
  }

  static void _registerHiveAdapters() {
    Hive.registerAdapter(UserAdapter());
    Hive.registerAdapter(ResourceAdapter());
    Hive.registerAdapter(ResourceTypeAdapter());
    Hive.registerAdapter(FileTypeAdapter());
  }

  static Future<void> clearBoxes() async {
    Hive.box(Databases.resources).clear();
    Hive.box(Databases.settings).clear();
  }
}

abstract class Databases {
  static const String credential = 'credential';
  static const String user = 'user';
  static const String resources = 'resources';
  static const String settings = 'settings';
}
