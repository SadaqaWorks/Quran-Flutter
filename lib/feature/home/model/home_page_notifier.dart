import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'home_page_state.dart';

final homePageProvider = StateNotifierProvider<HomePageNotifier, HomePageState>(
  (ref) => HomePageNotifier(HomePageState.initial()),
);

class HomePageNotifier extends StateNotifier<HomePageState> {
  HomePageNotifier(HomePageState state) : super(state);

  void viewTap() {
    print("HomePageNotifier viewTap ${state}");
    state.maybeWhen(
        initial: () {
          state = HomePageState.showInfo();
        },
        showInfo: () {
          state = HomePageState.initial();
        },
        showFullNavigator: () {
          state = HomePageState.showFullNavigator();
        },
        orElse: () {});
  }

  void showNavigator() {
    state = HomePageState.showFullNavigator();
  }

  void hideNavigator() {
    state = HomePageState.initial();
  }
}
