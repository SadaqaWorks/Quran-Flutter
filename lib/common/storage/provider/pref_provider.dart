import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/feature/quran_page/model/quran_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefServiceProvider =
    Provider<PrefService>((ref) => throw UnimplementedError());

class PrefService {
  PrefService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  Future<void> setLastReadPage(QuranPage page) async {
    await sharedPreferences.setString(
        'lastReadPage', json.encode(page.toJson()));
  }

  QuranPage? lastReadPage() {
    final value = sharedPreferences.getString('lastReadPage');
    if (value != null) {
      final result = json.decode(value);
      return QuranPage.fromJson(result);
    }
  }
}
