import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/connectivity/ConnectivityService.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/common/resource/manager/resource_manager.dart';

import '../model/app_startup_state.dart';

final appStartupModelProvider =
    StateNotifierProvider<AppStartupViewModel>((ref) {
  return AppStartupViewModel(ResourceManager(ref.watch(apiProvider)),
      ref.watch(connectivityCheckProvider));
});

class AppStartupViewModel extends StateNotifier<AppStartupState> {
  final ResourceManager resourceManager;
  final ConnectivityCheck connectivityCheck;
  late StreamSubscription _connectivityStreamSubscription;
  AppStartupViewModel(this.resourceManager, this.connectivityCheck)
      : super(const AppStartupState.initializing()) {
    _init();
    _connectivityStreamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result != ConnectivityResult.none &&
          state == AppStartupState.needsInternet()) {
        _init();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _connectivityStreamSubscription.cancel();
  }

  void _init() async {
    final result = await resourceManager.check();
    final connectivityStatus = await connectivityCheck.check();
    result.maybeWhen(
        available: (value) {
          state = AppStartupState.loadHome();
        },
        unAvailable: () {
          if (connectivityStatus != ConnectivityStatus.Online) {
            state = AppStartupState.needsInternet();
          }
        },
        needsToDownload: () {
          state = AppStartupState.needsToDownload();
        },
        orElse: () => {state = AppStartupState.needsToDownload()});
  }

  void reInit() {
    _init();
  }
}
