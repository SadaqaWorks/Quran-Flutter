import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/common/util/flutter_device_type.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  @override
  HomePageState get initialState {

      if (Device.get().isPhone || Device.get().isTablet) {
        debugPrint('HomePageEvent initialState HomePageHideView');
        return HomePageHideView();
      } else {
        debugPrint('HomePageEvent initialState HomePageShowView');
        return HomePageShowView();
      }

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
      if (Device.get().isPhone || Device.get().isTablet) {
        if (currentState is HomePageHideView) {
          yield HomePageShowView();
          debugPrint(
              'HomePageEvent ${event} ${currentState} on HomePageShowView');

          await Future.delayed(const Duration(seconds: 3), () async* {
            debugPrint(
                'HomePageEvent ${event} ${currentState} on HomePageShowView seconds');
            yield HomePageHideView();
          });
        }
        if (currentState is HomePageShowView) {
          debugPrint(
              'HomePageEvent ${event} ${currentState} on HomePageHideView');
          yield HomePageHideView();
        }
      }
    }

    if (event is HomePageMenuTapped) {
      yield HomePageShowSideView();
    }
  }

}
