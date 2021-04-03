import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quran_reader/common/resource/database.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

import 'navigator_view_event.dart';
import 'navigator_view_state.dart';

class NavigatorViewBloc extends Bloc<NavigatorViewEvent, NavigatorViewState> {
  final AyahInfoRepository ayahInfoService;
  final QuranPageBloc quranPageBloc;
  final HomePageBloc homePageBloc;

  NavigatorViewBloc(
      {required this.ayahInfoService,
      required this.quranPageBloc,
      required this.homePageBloc})
      : super(NavigatorViewStateInitial());

  @override
  Stream<NavigatorViewState> mapEventToState(NavigatorViewEvent event) async* {
    final NavigatorViewState currentState = state;

    if (event is NavigatorViewEventSelectSura) {
      yield NavigatorViewStateSuraSelected(sura: event.sura);
    }

    if (event is NavigatorViewEventSelectPage) {
      yield NavigatorViewStatePageSelected(pageNumber: event.pageNumber);
    }

    if (event is NavigatorViewEventSelectJuzz) {
      yield NavigatorViewStateJuzzSelected(juzzNumber: event.juzzNumber);
    }

    if (event is NavigatorViewEventConfirm) {
      QuranPage? _quranPage;

      if (currentState is NavigatorViewStatePageSelected) {
        _quranPage = QuranPage(pageNumber: currentState.pageNumber);
      }

      if (currentState is NavigatorViewStateSuraSelected) {
        final _quranPageInfo = await ayahInfoService.getQuranPageInfo(
            suraNumber: currentState.sura.suraNumber);

        _quranPage = QuranPage(pageNumber: _quranPageInfo.pageNumber);
      }

      if (_quranPage != null) {
        homePageBloc.add(HomePageEventHideNavigatorTap());
        quranPageBloc
            .add(QuranPageEventLoad(pageNumber: _quranPage.pageNumber));
        yield NavigatorViewStateConfirmed(pageNumber: _quranPage.pageNumber);
      }
    }
  }
}
