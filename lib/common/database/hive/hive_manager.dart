import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static const int userTypeID = 1;

  static Future<void> initialize() async {
    await Hive.initFlutter('hive');
    _registerHiveAdapters();
    await Future.wait([
      Hive.openBox(HiveBoxes.settings),
    ]);
  }

  static void _registerHiveAdapters() {
  }

  static Future<void> clearBoxes() async {}
}

abstract class HiveBoxes {
  static const String credential = 'credential';
  static const String user = 'user';
  static const String settings = 'settings';
}
