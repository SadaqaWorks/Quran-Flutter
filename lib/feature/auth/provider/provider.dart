import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/model/user.dart';

final authProvider = Provider<User?>((ref) {
  return User(id: '', email: '');
});
