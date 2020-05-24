import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/common/constant/constants.dart' as constants;
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/model/quran_page.dart';
import 'package:rxdart/rxdart.dart';

class QuranPageBloc extends HydratedBloc<QuranPageEvent, QuranPageState> {
  @override
  QuranPageState get initialState =>
      super.initialState ??
      QuranPageLoaded(
          quranPage: fetchQuranPage(constants.startQuranPageNumber));

  @override
  QuranPageState fromJson(Map<String, dynamic> json) {
    try {
      return QuranPageLoaded(quranPage: QuranPage.fromJson(json['value']));
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<Transition<QuranPageEvent, QuranPageState>> transformEvents(
    Stream<QuranPageEvent> events,
    TransitionFunction<QuranPageEvent, QuranPageState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<QuranPageState> mapEventToState(QuranPageEvent event) async* {
    final QuranPageState currentState = state;


    if (event is JumpToPage && currentState is QuranPageLoaded) {
      yield QuranPageLoaded(quranPage: fetchQuranPage(event.pageNumber));
    }
  }

  @override
  Map<String, QuranPage> toJson(QuranPageState state) {
    try {
      if (state is QuranPageLoaded) {
        return {'value': state.quranPage};
      }
      if (state is QuranPageJumpedTo) {
        return {'value': state.quranPage};
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  QuranPage fetchQuranPage(int page) {
    return QuranPage(
        page: page, imageUrl: 'assets/images/quran/image$page.png');
  }
}
