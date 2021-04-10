import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_page_state.dart';

final homePageProvider = StateNotifierProvider<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(HomePageState.initial()),
);

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(HomePageState state) : super(state) {}
  Timer? _timer;

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }

  _setTimer() {
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      state.maybeWhen(
          showInfo: () {
            _timer?.cancel();
            state = HomePageState.initial();
          },
          orElse: () {});
    });
  }

  void viewTap() {
    state.maybeWhen(initial: () {
      state = HomePageState.showInfo();
      _setTimer();
    }, showInfo: () {
      _timer?.cancel();
      state = HomePageState.initial();
    }, showFullNavigator: () {
      _timer?.cancel();
      state = HomePageState.initial();
    }, orElse: () {
      _timer?.cancel();
    });
  }

  void showNavigator() {
    state = HomePageState.showFullNavigator();
    _timer?.cancel();
  }

  void hideNavigator() {
    state = HomePageState.initial();
    _timer?.cancel();
  }
}
