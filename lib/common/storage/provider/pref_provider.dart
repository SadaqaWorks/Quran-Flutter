import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final prefServiceProvider =
    Provider<PrefService>((ref) => throw UnimplementedError());

class PrefService {
  PrefService(this.sharedPreferences);
  final SharedPreferences sharedPreferences;

  Future<void> setLastReadPage(int page) async {
    await sharedPreferences.setInt('lastReadPage', page);
  }

  int? lastReadPage() {
    final value = sharedPreferences.getInt('lastReadPage');
    return value;
  }
  //
  // Future<void> setMushafType(MushafType type) async {
  //   await sharedPreferences.setString(
  //       'mushafType', json.encode(type.toString()));
  // }
  //
  // MushafType mushafType() {
  //   final value = sharedPreferences.getString('mushafType');
  //   if (value != null) {
  //     final result = mushafTypeFromString(json.decode(value));
  //     return (result != null) ? result : MushafType.madani;
  //   } else {
  //     return MushafType.madani;
  //   }
  // }
}
