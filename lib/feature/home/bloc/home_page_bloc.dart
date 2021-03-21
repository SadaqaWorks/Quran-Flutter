import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  QuranPage? quranPage;

  HomePageBloc() : super(HideNavigatorViewState()) {}

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

    if (event is HomePageViewTappedEvent) {
      if (currentState is HideNavigatorViewState) {
        yield InitialHomeViewState();
      }
      if (currentState is InitialHomeViewState) {
        yield HideNavigatorViewState();
      }
    }

    if (event is HomePageShowNavigatorTappedEvent) {
      yield ShowNavigatorViewState();
    }

    if (event is HomePageHideNavigatorTappedEvent) {
      yield HideNavigatorViewState();
    }
  }
}
