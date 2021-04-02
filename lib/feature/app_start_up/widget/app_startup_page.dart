import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/feature/app_start_up/provider/app_startup_provider.dart';
import 'package:quran_reader/feature/auth/ui/auth_widget.dart';
import 'package:quran_reader/feature/home/ui/page/home_page.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final state = watch(appStartupModelProvider.state);
    return state.maybeWhen(
        initializing: () => const Center(child: CircularProgressIndicator()),
        needsAuth: () => AuthWidget(),
        needsToDownloadFile: () => AuthWidget(),
        loadHome: () => HomePage(),
        orElse: () => const Center(child: CircularProgressIndicator()));
  }
}
