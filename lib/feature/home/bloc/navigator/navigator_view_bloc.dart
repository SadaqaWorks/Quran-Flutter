import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quran_reader/common/database/database.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'navigator_view_event.dart';
import 'navigator_view_state.dart';
import 'package:meta/meta.dart';


class NavigatorViewBloc extends Bloc<NavigatorViewEvent, NavigatorViewState> {

  final AyahInfoService ayahInfoService;
  final QuranPageBloc quranPageBloc;
  final HomePageBloc homePageBloc;

  NavigatorViewBloc({@required this.ayahInfoService,@required this.quranPageBloc,@required this.homePageBloc})
      : assert(ayahInfoService != null);

  @override
  NavigatorViewState get initialState => InitialNavigatorViewState();

  @override
  Stream<NavigatorViewState> mapEventToState(NavigatorViewEvent event) async* {
    final currentState = state;

      if(event is NavigatorViewSelectSuraEvent){
          yield SuraSelectNavigatorViewState(sura: event.sura);
      }

      if(event is NavigatorViewSelectPageEvent){
        yield PageSelectNavigatorViewState(pageNumber: event.pageNumber);
      }

      if(event is NavigatorViewSelectJuzzEvent){
        yield JuzzSelectNavigatorViewState(juzzNumber: event.juzzNumber);
      }

      if(event is NavigatorViewConfirmEvent){
         QuranPage _quranPage;

        if(currentState is PageSelectNavigatorViewState){
          _quranPage = QuranPage(pageNumber: currentState.pageNumber);
        }

        if(currentState is SuraSelectNavigatorViewState){
          final _quranPageInfo = await ayahInfoService.getQuranPageInfo(suraNumber: currentState.sura.suraNumber);
          _quranPage =  QuranPage(pageNumber: _quranPageInfo.pageNumber);
        }

        if(_quranPage != null) {
          homePageBloc.add(
              HomePageHideNavigatorTappedEvent(quranPage: _quranPage));
          quranPageBloc.add(JumpToPageEvent(pageNumber: _quranPage.pageNumber));
          yield NavigatorViewConfirmState(pageNumber: _quranPage.pageNumber);
        }
      }
  }



  }
