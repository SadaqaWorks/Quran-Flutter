import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/connectivity/connectivity_service.dart';
import 'package:quran_reader/common/http/api_provider.dart';
import 'package:quran_reader/feature/app_start_up/provider/resources_sync_repository.dart';

import '../model/app_startup_state.dart';

final appStartupProvider =
    StateNotifierProvider<AppStartupNotifier, AppStartupState>((ref) {
  return AppStartupNotifier(ResourcesSyncRepository(ref.watch(apiProvider)),
      ref.watch(connectivityCheckProvider));
});

class AppStartupNotifier extends StateNotifier<AppStartupState> {
  final ResourcesSyncRepository resourceManager;
  final ConnectivityCheck connectivityCheck;
  late StreamSubscription _connectivityStreamSubscription;

  AppStartupNotifier(this.resourceManager, this.connectivityCheck)
      : super(const AppStartupState.initializing()) {
    _init();
    _connectivityStreamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result != ConnectivityResult.none &&
          state == AppStartupState.internetUnAvailable()) {
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
    final result = await resourceManager.sync();
    final connectivityStatus = await connectivityCheck.check();
    result.maybeWhen(
        available: (value) {
          state = AppStartupState.loadHome();
        },
        unAvailable: () {
          if (connectivityStatus != ConnectivityStatus.Online) {
            state = AppStartupState.internetUnAvailable();
          }
        },
        needsToDownload: () {
          if (connectivityStatus != ConnectivityStatus.Online) {
            state = AppStartupState.internetUnAvailable();
          }else{
            state = AppStartupState.needsToDownload();
          }
        },
        orElse: () {
          if (connectivityStatus != ConnectivityStatus.Online) {
            state = AppStartupState.internetUnAvailable();
          }else{
            state = AppStartupState.needsToDownload();
          }
        });
  }

  void reInit() {
    _init();
  }
}
