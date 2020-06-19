import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:rxdart/rxdart.dart';
import 'package:meta/meta.dart';

class HomePageBloc extends Bloc<HomePageEvent, HomePageState> {

  StreamSubscription _quranPageBlocSubscription;
  final QuranPageBloc quranPageBloc;
  QuranPage _quranPage;

  HomePageBloc({@required this.quranPageBloc}) : assert(quranPageBloc != null) {
    _quranPageBlocSubscription = quranPageBloc.listen((state) {

      if (state is QuranPageLoaded) {
        _quranPage = state.quranPage;
        _quranPage.page = _quranPage.page + 1;
      }

      if (state is QuranPageJumpedTo) {
        _quranPage = state.quranPage;
        _quranPage.page = _quranPage.page + 1;
      }
    });
  }

  @override
  HomePageState get initialState {
    return HomePageHideView(quranPage: _quranPage);
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

    if (event is HomePageViewTapped) {
      if (currentState is HomePageHideView) {
        yield HomePageShowNavigatorInitialView(quranPage: currentState.quranPage);
      }
      if (currentState is HomePageShowNavigatorInitialView) {
        yield HomePageHideView(quranPage: currentState.quranPage);
      }
    }
  }
}
