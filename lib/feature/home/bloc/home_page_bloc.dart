import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/common/util/flutter_device_type.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends HydratedBloc<HomePageEvent, HomePageState> {



  @override
  HomePageState get initialState {
    if (super.initialState != null) {
      debugPrint('HomePageEvent initialState previous ${super.initialState}');
      return super.initialState;
    } else {
      if (Device.get().isPhone || Device.get().isTablet) {
        debugPrint('HomePageEvent initialState HomePageHideView');
        return HomePageHideView();
      } else {
        debugPrint('HomePageEvent initialState HomePageShowView');
        return HomePageShowView();

      }
    }
  }

  @override
  HomePageState fromJson(Map<String, dynamic> json) {
    try {
      return HomePageShowView();
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<HomePageState> transformEvents(
    Stream<HomePageEvent> events,
    Stream<HomePageState> Function(HomePageEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        const Duration(milliseconds: 500),
      ),
      next,
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
      } else {
        yield HomePageShowView();
      }
    }

    if(event is HomePageMenuTapped){
      yield HomePageShowSideView();
    }

  }

  @override
  Map<String, dynamic> toJson(HomePageState state) {
    try {
      if (state is HomePageShowView) {
        return {'value': state};
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }
}
