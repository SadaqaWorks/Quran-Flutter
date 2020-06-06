import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran/common/constant/constants.dart' as constants;
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/model/quran_page.dart';
import 'package:rxdart/rxdart.dart';
import 'package:quran/common/database/database.dart';

class QuranPageBloc extends HydratedBloc<QuranPageEvent, QuranPageState> {

  final AyahInfoService ayahInfoService;

  QuranPageBloc({@required this.ayahInfoService}) : assert(ayahInfoService != null){

  }

  @override
  QuranPageState get initialState {
    return super.initialState ??
        QuranPageJumpedTo(
            quranPage: fetchQuranPage(constants.startQuranPageNumber));
  }

  @override
  QuranPageState fromJson(Map<String, dynamic> json) {
    try {
      return QuranPageJumpedTo(quranPage: QuranPage.fromJson(json['value']));
    } catch (exception) {
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

    if (event is JumpToPage) {
      yield* _mapJumpToPage(event);
    }

    if (event is LoadPage) {
      yield* _mapLoadPage(event);
    }
  }

  @override
  Map<String, Map<String, dynamic>> toJson(QuranPageState state) {
    try {
      if (state is QuranPageLoaded) {
        return {'value': state.quranPage.toJson()};
      }
      if (state is QuranPageJumpedTo) {
        return {'value': state.quranPage.toJson()};
      } else {
        return null;
      }
    } catch (_) {
      return null;
    }
  }

  Stream<QuranPageState> _mapJumpToPage(JumpToPage event) async* {
    final _quranPage = fetchQuranPage(event.pageNumber);
    _quranPage.quranPageInfoList = await ayahInfoService.getQuranPageInfo(pageNumber: _quranPage.page);
    yield QuranPageJumpedTo(quranPage: _quranPage);
  }

  Stream<QuranPageState> _mapLoadPage(LoadPage event) async* {
    final _quranPage = fetchQuranPage(event.pageNumber);
    _quranPage.quranPageInfoList = await ayahInfoService.getQuranPageInfo(pageNumber: _quranPage.page);
    yield QuranPageLoaded(quranPage: _quranPage);
  }

  QuranPage fetchQuranPage(int page) {
    return QuranPage(
        page: page, imageUrl: 'assets/images/quran/image$page.png');
  }
}
