// class NavigatorViewBloc extends Bloc<NavigatorViewEvent, NavigatorViewState> {
//   final AyahInfoRepository ayahInfoService;
//
//   NavigatorViewBloc({required this.ayahInfoService})
//       : super(NavigatorViewStateInitial());
//
//   @override
//   Stream<NavigatorViewState> mapEventToState(NavigatorViewEvent event) async* {
//     final NavigatorViewState currentState = state;
//
//     if (event is NavigatorViewEventSelectSura) {
//       yield NavigatorViewStateSuraSelected(sura: event.sura);
//     }
//
//     if (event is NavigatorViewEventSelectPage) {
//       yield NavigatorViewStatePageSelected(pageNumber: event.pageNumber);
//     }
//
//     if (event is NavigatorViewEventSelectJuzz) {
//       yield NavigatorViewStateJuzzSelected(juzzNumber: event.juzzNumber);
//     }
//
//     if (event is NavigatorViewEventConfirm) {
//       QuranPage? _quranPage;
//
//       if (currentState is NavigatorViewStatePageSelected) {
//         _quranPage = QuranPage(pageNumber: currentState.pageNumber);
//       }
//
//       if (currentState is NavigatorViewStateSuraSelected) {
//         final _quranPageInfo = await ayahInfoService.getQuranPageInfo(
//             suraNumber: currentState.sura.suraNumber);
//
//         _quranPage = QuranPage(pageNumber: _quranPageInfo.pageNumber);
//       }
//
//       if (_quranPage != null) {
//         //homePageBloc.add(HomePageEventHideNavigatorTap());
//
//         yield NavigatorViewStateConfirmed(pageNumber: _quranPage.pageNumber);
//       }
//     }
//   }
// }
