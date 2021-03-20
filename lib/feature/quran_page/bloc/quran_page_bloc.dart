import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/common/constant/constants.dart' as constants;
import 'package:quran_reader/common/database/database.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';

class QuranPageBloc extends HydratedBloc<QuranPageEvent, QuranPageState> {
  final AyahInfoService ayahInfoService;

  QuranPage fetchQuranPage(int page) {
    return QuranPage(
        pageNumber: page, imageUrl: 'assets/images/quran/$page.png');
  }

  QuranPageBloc({required this.ayahInfoService})
      : super(InitialQuranPageState(
            quranPage: QuranPage(
                pageNumber: constants.startQuranPageNumber,
                imageUrl:
                    'assets/images/quran/${constants.startQuranPageNumber}.png'))) {
    add(QuranPageStartEvent());
  }

  @override
  QuranPageState? fromJson(Map<String, dynamic> json) {
    try {
      final quranPage =
          QuranPage.fromJson(Map<String, dynamic>.from(json['value']));
      return QuranPageJumpedToState(quranPage: quranPage);
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
      events.debounceTime(const Duration(milliseconds: 2)),
      transitionFn,
    );
  }

  @override
  Stream<QuranPageState> mapEventToState(QuranPageEvent event) async* {
    if (event is QuranPageStartEvent) {
      yield* _mapStartPage(event);
    }

    if (event is JumpToPageEvent) {
      yield* _mapJumpToPage(event);
    }

    if (event is LoadPageEvent) {
      yield* _mapLoadPage(event);
    }
  }

  @override
  Map<String, Map<String, dynamic>>? toJson(QuranPageState state) {
    try {
      if (state is QuranPageLoadedState) {
        return {'value': state.quranPage.toJson()};
      }
      if (state is QuranPageJumpedToState) {
        return {'value': state.quranPage.toJson()};
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  Stream<QuranPageState> _mapStartPage(QuranPageStartEvent event) async* {
    yield QuranPageJumpedToState(
        quranPage: fetchQuranPage(constants.startQuranPageNumber));
  }

  Stream<QuranPageState> _mapJumpToPage(JumpToPageEvent event) async* {
    final _quranPage = fetchQuranPage(event.pageNumber);
    _quranPage.quranPageInfoList = await ayahInfoService.getQuranPageInfoList(
        pageNumber: _quranPage.pageNumber);
    yield QuranPageJumpedToState(quranPage: _quranPage);
  }

  Stream<QuranPageState> _mapLoadPage(LoadPageEvent event) async* {
    final _quranPage = fetchQuranPage(event.pageNumber);
    _quranPage.quranPageInfoList = await ayahInfoService.getQuranPageInfoList(
        pageNumber: _quranPage.pageNumber);
    yield QuranPageLoadedState(quranPage: _quranPage);
  }
}
