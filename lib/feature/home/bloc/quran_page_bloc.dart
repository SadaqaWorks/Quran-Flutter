import 'dart:async';

import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/model/quran_page.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quran/common/constant/constants.dart' as Constants;

class QuranPageBloc extends HydratedBloc<QuranPageEvent, QuranPageState> {
  @override
  QuranPageState get initialState =>
      super.initialState ?? QuranPageLoaded(quranPage: _fetchQuranPage(1));

  @override
  QuranPageState fromJson(Map<String, dynamic> json) {
    try {
      return QuranPageLoaded(quranPage: QuranPage.fromJson(json['value']));
    } catch (_) {
      return null;
    }
  }

  @override
  Stream<QuranPageState> transformEvents(
    Stream<QuranPageEvent> events,
    Stream<QuranPageState> Function(QuranPageEvent event) next,
  ) {
    return super.transformEvents(
      events.debounceTime(
        const Duration(milliseconds: 500),
      ),
      next,
    );
  }

  @override
  Stream<QuranPageState> mapEventToState(QuranPageEvent event) async* {
    final QuranPageState currentState = state;

    if (event is QuranPageBackward) {
      if (currentState is QuranPageLoaded) {
        if (currentState.quranPage.page != Constants.startQuranPageNumber) {
          yield QuranPageBackward();
          final quranPage = _fetchQuranPage(currentState.quranPage.page - 1);
          yield QuranPageLoaded(quranPage: quranPage);
        }
      }
    }

    if (event is QuranPageForward) {
      if (currentState is QuranPageLoaded) {
        if (currentState.quranPage.page != Constants.endQuranPageNumber) {
          yield QuranPageForward();
          yield QuranPageLoaded(
              quranPage: _fetchQuranPage(currentState.quranPage.page + 1));
        }
      }
    }
  }

  @override
  Map<String, QuranPage> toJson(QuranPageState state) {
    try {
      if (state is QuranPageLoaded) {
        return {'value': state.quranPage};
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  QuranPage _fetchQuranPage(int page) {
    return QuranPage(
        page: page, imageUrl: 'assets/images/quran/image$page.png');
  }
}
