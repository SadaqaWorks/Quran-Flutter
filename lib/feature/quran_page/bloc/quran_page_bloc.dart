import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:quran_reader/common/constant/constants.dart';
import 'package:quran_reader/common/database/database.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';

class QuranPageBloc extends HydratedBloc<QuranPageEvent, QuranPageState> {
  final AyahInfoService ayahInfoService;
  final HomePageBloc homePageBloc;

  QuranPageBloc({required this.ayahInfoService, required this.homePageBloc})
      : super(QuranPageStateInitial()) {
    hydrate();
    if (state is QuranPageStateInitial) {
      add(QuranPageEventLoad(pageNumber: startQuranPageNumber));
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
    if (event is QuranPageEventLoad) {
      yield* _mapLoadPage(event);
    }
  }

  @override
  Map<String, Map<String, dynamic>>? toJson(QuranPageState state) {
    try {
      if (state is QuranPageStateLoaded) {
        Map<String, dynamic> data = {};

        data['first_page'] = state.firstQuranPage.toJson();

        if (state.secondQuranPage != null) {
          data['second_page'] = state.secondQuranPage!.toJson();
        }
        return {'quran_pages': data};
      } else {
        return null;
      }
    } catch (exception) {
      return null;
    }
  }

  @override
  QuranPageState? fromJson(Map<String, dynamic> json) {
    try {
      if (json['quran_pages'] != null) {
        final quranPages = json['quran_pages'];
        final firstQuranPage = QuranPage.fromJson(
            Map<String, dynamic>.from(quranPages['first_page']));
        homePageBloc.quranPage = firstQuranPage;

        if (quranPages['second_page'] != null) {
          final secondQuranPage = QuranPage.fromJson(
              Map<String, dynamic>.from(quranPages['second_page']));

          return QuranPageStateLoaded(
              firstQuranPage: firstQuranPage, secondQuranPage: secondQuranPage);
        } else {
          return QuranPageStateLoaded(firstQuranPage: firstQuranPage);
        }
      } else {
        QuranPage firstQuranPage = QuranPage(
            pageNumber: startQuranPageNumber,
            imageUrl: 'assets/images/quran/${startQuranPageNumber}.png');
        homePageBloc.quranPage = firstQuranPage;

        return QuranPageStateLoaded(firstQuranPage: firstQuranPage);
      }
    } catch (exception) {
      QuranPage firstQuranPage = QuranPage(
          pageNumber: startQuranPageNumber,
          imageUrl: 'assets/images/quran/${startQuranPageNumber}.png');
      homePageBloc.quranPage = firstQuranPage;

      return QuranPageStateLoaded(firstQuranPage: firstQuranPage);
    }
  }

  Stream<QuranPageState> _mapLoadPage(QuranPageEventLoad event) async* {
    if (event.pageNumber >= startQuranPageNumber &&
        event.pageNumber <= endQuranPageNumber) {
      final _firstQuranPage = await _fetchQuranPage(event.pageNumber);
      final _secondQuranPage = await _fetchQuranPage(event.pageNumber + 1);

      homePageBloc.quranPage = _firstQuranPage;
      homePageBloc.add(HomePageEventViewTap());
      yield QuranPageStateLoaded(
          firstQuranPage: _firstQuranPage, secondQuranPage: _secondQuranPage);
    }
  }

  Future<QuranPage> _fetchQuranPage(int page) async {
    QuranPage quranPage =
        QuranPage(pageNumber: page, imageUrl: 'assets/images/quran/$page.png');
    quranPage.quranPageInfoList = await ayahInfoService.getQuranPageInfoList(
        pageNumber: quranPage.pageNumber);
    return quranPage;
  }
}
