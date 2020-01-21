import 'dart:async';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quran/common/util/flutter_device_type.dart';

class HomePageBloc extends HydratedBloc<HomePageEvent, HomePageState> {

  @override
  HomePageState get initialState =>
      super.initialState ?? HomePageInitial();

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
        print('is a mobile');
        if(currentState is QuranPageInitial && event is HomePageViewTapped){
          yield HomePageShowView();
        }
    }else  {
        print('is a big');
        if(currentState is QuranPageInitial){
          yield HomePageShowView();
        }
    }



//    if (event is ShowBackward) {
//      if (currentState is QuranPageLoaded) {
//        if (currentState.quranPage.page != 1) {
//          yield QuranPageBackward();
//          yield QuranPageLoaded(
//              quranPage: _fetchQuranPage(currentState.quranPage.page - 1));
//        }
//      }
//    }
//
//    if (event is ShowForward) {
//      if (currentState is QuranPageLoaded) {
//        if (currentState.quranPage.page != 605) {
//          yield QuranPageForward();
//          yield QuranPageLoaded(
//              quranPage: _fetchQuranPage(currentState.quranPage.page + 1));
//        }
//      }
//    }
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
