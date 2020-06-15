import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  @override
  HomePageState get initialState {
    return HomePageHideView();
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

    if (event is HomePageViewTapped) {
      if (currentState is HomePageHideView) {
        yield HomePageShowView();
      }
      if (currentState is HomePageShowView) {
        yield HomePageHideView();
      }
    }

    if (event is HomePageMenuTapped) {
      yield HomePageShowSideView();
    }
  }
}
