import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';

import 'home_page_event.dart';
import 'home_page_state.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {
  StreamSubscription _quranPageBlocSubscription;
  final QuranPageBloc quranPageBloc;
  QuranPage _quranPage;

  HomePageBloc({@required this.quranPageBloc}) : assert(quranPageBloc != null) ,
        super(HideNavigatorViewState(quranPage: quranPageBloc.state.quranPage)) {

    _quranPageBlocSubscription = quranPageBloc.listen((state) {
      if (state is QuranPageLoadedState) {
        _quranPage = state.quranPage;
        _quranPage.pageNumber = _quranPage.pageNumber + 1;
      }

      if (state is QuranPageJumpedToState) {
        _quranPage = state.quranPage;
        _quranPage.pageNumber = _quranPage.pageNumber + 1;
      }
    });
  }


  @override
  Future<void> close() {
    _quranPageBlocSubscription.cancel();
    return super.close();
  }

  @override
  Stream<Transition<HomePageEvent, HomePageState>> transformEvents(
    Stream<HomePageEvent> events,
    TransitionFunction<HomePageEvent, HomePageState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  @override
  Stream<HomePageState> mapEventToState(HomePageEvent event) async* {
    final HomePageState currentState = state;

    if (event is HomePageViewTappedEvent) {
      if (currentState is HideNavigatorViewState) {
        yield InitialHomeViewState(quranPage: currentState.quranPage);
      }
      if (currentState is InitialHomeViewState) {
        yield HideNavigatorViewState(quranPage: currentState.quranPage);
      }
    }

    if (event is HomePageShowNavigatorTappedEvent) {
      yield ShowNavigatorViewState(quranPage: event.quranPage);
    }

    if (event is HomePageHideNavigatorTappedEvent) {
      yield HideNavigatorViewState(quranPage: event.quranPage);
    }
  }
}
