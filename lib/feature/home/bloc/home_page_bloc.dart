import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:rxdart/rxdart.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  HomePageBloc() : super(HomePageStateInitial()) {}

  @override
  Future<void> close() {
    return super.close();
  }

  @override
  Stream<Transition<HomePageEvent, HomePageState>> transformEvents(
    Stream<HomePageEvent> events,
    TransitionFunction<HomePageEvent, HomePageState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    final HomePageState currentState = state;

    if (event is HomePageEventViewTap) {
      if (currentState is HomePageStateShowInfo ||
          currentState is HomePageStateShowFullNavigator) {
        yield HomePageStateInitial();
      }
      if (currentState is HomePageStateInitial) {
        yield HomePageStateShowInfo();
      }
    }

    if (event is HomePageShowNavigatorTappedEvent) {
      yield HomePageStateShowFullNavigator();
    }

    if (event is HomePageEventHideNavigatorTap) {
      yield HomePageStateInitial();
    }
  }
}
