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
      debugPrint(
          'HomePageEvent initialState ${super.initialState}');
      return super.initialState;
    } else {
      if (Device.get().isPhone || Device.get().isTablet) {
        debugPrint(
            'HomePageEvent initialState HomePageHideView');
        return HomePageHideView();
      } else {
        debugPrint(
            'HomePageEvent initialState HomePageShowView');
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
          //this.add(HomePageViewNormal());
//        Future.delayed(const Duration(milliseconds: 5000), () async* {
//          yield HomePageHideView();
//        });

        }

        if (currentState is HomePageShowView) {
          //yield HomePageHideView();
          debugPrint(
              'HomePageEvent ${event} ${currentState} on HomePageHideView');
          //this.add(HomePageViewNormal());
        }
      } else {
        yield HomePageShowView();
      }
    }else{
      debugPrint(
          'HomePageEvent ${event} ${currentState} on else');
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
