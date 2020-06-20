import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/constant/constants.dart' as constants;
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/home/ui/widget/quran_page_widget.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
import 'package:quran_reader/generated/l10n.dart';
import 'package:wakelock/wakelock.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  void dispose() {
    if (Device.get().isIos || Device.get().isAndroid) {
      Wakelock.disable();
    }
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (Device.get().isIos || Device.get().isAndroid) {
      Wakelock.enable();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Scaffold(body: BlocBuilder<HomePageBloc, HomePageState>(
                builder: (context, state) {
              if (state is HideNavigatorViewState) {
                return QuranPageWidget();
              } else {
                return _overlayView();
              }
            })),
          );
        });
  }

  //Action
  void _showNavigatorAction(QuranPage _quranPage){
    BlocProvider.of<HomePageBloc>(context)
        .add(HomePageShowNavigatorTappedEvent(quranPage: _quranPage));
  }

  void _hideNavigatorAction(QuranPage _quranPage){
    BlocProvider.of<HomePageBloc>(context)
        .add(HomePageHideNavigatorTappedEvent(quranPage: _quranPage));
  }

  //Widget
  Widget _showNavigatorButton(QuranPage _quranPage){
    return SizedBox(
        height: 18.0,
        width: 18.0,
        child: IconButton(
      icon: Icon(Icons.arrow_drop_up,color: Colors.black87),
      onPressed: () => {
        _showNavigatorAction(_quranPage)
      }, padding: new EdgeInsets.all(0.0),

    ));
  }

  Widget _hideNavigatorButton(QuranPage _quranPage){
    return Padding(
        padding: const EdgeInsets.all(12.0),

    child:  SizedBox(
        height: 18.0,
        width: 18.0,
        child:IconButton(
      icon: Icon(Icons.arrow_drop_down,color: Colors.black87),
      onPressed: () => {
        _hideNavigatorAction(_quranPage)
      },padding: new EdgeInsets.all(0.0)
    )));
  }

  Widget _ayatInfo(QuranPage _quranPage) {
    return Text(
      "${_quranPage.quranPageInfoList.first.suraNumber}. (${_quranPage.quranPageInfoList.first.nameArabic}) ${_quranPage.quranPageInfoList.first.name} \n${S.of(context).page}: ${_quranPage.page}",
      style: TextStyle(
        fontSize: 18.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _bottomSlider(QuranPage _quranPage) {
    return Container(
        decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
        child: Slider(
          divisions: constants.end_quran_page_number,
          activeColor: Theme.of(context).primaryColorLight,
          inactiveColor: Theme.of(context).accentColor,
          min: constants.start_quran_page_number.toDouble(),
          max: constants.end_quran_page_number.toDouble(),
          onChanged: (newValue) {
            BlocProvider.of<QuranPageBloc>(context)
              ..add(JumpToPageEvent(pageNumber: newValue.toInt()));
          },
          value: _quranPage.page.toDouble(),
          label: _quranPage.page.toString(),
        ));
  }

  Widget _overlayView() {
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).accentColor.withOpacity(.3)),
        QuranPageWidget(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: BlocBuilder<QuranPageBloc, QuranPageState>(
                builder: (context, state) {
                if (state is QuranPageLoadedState || state is QuranPageJumpedToState) {
                  QuranPage _quranPage;

                  if (state is QuranPageLoadedState) {
                    _quranPage = state.quranPage;
                    _quranPage.page = _quranPage.page + 1;
                  }

                  if (state is QuranPageJumpedToState) {
                    _quranPage = state.quranPage;
                    _quranPage.page = _quranPage.page + 1;
                  }

                return BlocBuilder<HomePageBloc, HomePageState>(
                      builder: (context, state) {
                        if (state is InitialNavigatorViewState) {
                          return _initialNavigatorWidget(_quranPage);
                        } else {
                          return _fullNavigatorWidget(_quranPage);
                        }
                      });
                }

                return Container(color: Theme.of(context).accentColor);
              }),
            ))
      ],
    );
  }

  Widget _initialNavigatorWidget(QuranPage _quranPage){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Theme.of(context).accentColor),
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 16, top: 0, right: 16, bottom: 4),
                  child: Container(
                      child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: <Widget>[
                            _showNavigatorButton(_quranPage),
                            _ayatInfo(_quranPage)
                          ])))),
          SizedBox(height: 10),
          _bottomSlider(_quranPage)
        ]);
  }

  Widget _fullNavigatorWidget(QuranPage _quranPage){
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Theme.of(context).accentColor),
                child: Padding(
                    padding: EdgeInsets.only(
                        left: 16, top: 4, right: 16, bottom: 4),
                    child: Container(
                        child: Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: <Widget>[
                              _hideNavigatorButton(_quranPage),
                            ])))),
          SizedBox(height: 50),
        ]);

  }
}
