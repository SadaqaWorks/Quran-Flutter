import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/app_startup_state.dart';

final appStartupModelProvider =
    StateNotifierProvider<AppStartupViewModel>((ref) {
  return AppStartupViewModel();
});

class AppStartupViewModel extends StateNotifier<AppStartupState> {
  AppStartupViewModel() : super(const AppStartupState.initializing()) {
    _init();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _init() async {
    //state = AppStartupState.needsAuth();
    //state = AppStartupState.needsToDownloadFile();
    state = AppStartupState.loadHome();
  }

  void reInit() {
    _init();
  }
}
