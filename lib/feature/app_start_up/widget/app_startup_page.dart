import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/widget/need_internet_widget.dart';
import 'package:quran_reader/feature/app_start_navigator/widget/app_start_navigator_widget.dart';
import 'package:quran_reader/feature/app_start_up/provider/app_startup_provider.dart';
import 'package:quran_reader/feature/home/ui/page/home_page.dart';

/// This is the "root" widget of the app, which sits just below MaterialApp.
/// It performs app-state initialization and returns the appropriate page.
class AppStartupPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(appStartupProvider);
    return state.maybeWhen(
        initializing: () => const Center(child: CircularProgressIndicator()),
        needsAuth: () => HomePage(),
        needsToDownload: () => AppStartNavigatorWidget(),
        loadHome: () => HomePage(),
        internetUnAvailable: () => NeedInternetWidget(),
        orElse: () => const Center(child: CircularProgressIndicator()));
  }
}
