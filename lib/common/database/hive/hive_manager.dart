import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HiveManager {
  static const int userTypeID = 1;

  static Future<void> initialize() async {
    await Hive.initFlutter();
    _registerHiveAdapters();
    await Future.wait([
      Hive.openBox(HiveBoxes.settings),
      Hive.openBox<Contact>(HiveBoxes.contacts1),
      Hive.openBox<Contact>(HiveBoxes.contacts2)
    ]);
  }

  static void _registerHiveAdapters() {
    //Hive.registerAdapter(ContactAdapter());
  }

  static Future<void> clearBoxes() async {}
}

abstract class HiveBoxes {
  static const String credential = 'credential';
  static const String user = 'user';
  static const String settings = 'settings';
  static const String contacts1 = "contacts_1";
  static const String contacts2 = "contacts_2";
}

@HiveType(typeId: 0)
class Contact {
  @HiveField(0)
  String name;
  @HiveField(1)
  int age;
  @HiveField(2)
  String phoneNumber;

  Contact(this.name, this.age, this.phoneNumber);
}
