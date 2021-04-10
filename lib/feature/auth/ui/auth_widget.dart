import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/feature/auth/provider/provider.dart';

class AuthWidget extends ConsumerWidget {
  const AuthWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final authState = watch(authProvider);
    return Container();
  }
}
