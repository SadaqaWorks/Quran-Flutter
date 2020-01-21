import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/common/util/flutter_device_type.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:rxdart/rxdart.dart';

class HomePageBloc extends HydratedBloc<HomePageEvent, HomePageState> {
  @override
  HomePageState get initialState => super.initialState ?? HomePageInitial();

  @override
  HomePageState fromJson(Map<String, dynamic> json) {
    try {
      return HomePageInitial();
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

    if (Device.get().isPhone || Device.get().isTablet) {
      if (currentState is HomePageInitial && event is HomePageViewTapped) {
        yield HomePageShowView();

        Future.delayed(const Duration(milliseconds: 5000), () async* {
          yield HomePageHideView();
        });
      }

      if (currentState is HomePageShowView && event is HomePageViewTapped) {
        yield HomePageHideView();
      }
    } else {
      print('is a big');
      if (currentState is QuranPageInitial) {
        yield HomePageShowView();
      }
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
