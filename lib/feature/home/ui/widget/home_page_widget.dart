import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/feature/home/provider/index.dart';
import 'package:quran_reader/feature/navigator/widget/navigator_widget.dart';
import 'package:quran_reader/feature/quran_page/provider/index.dart';
import 'package:quran_reader/feature/quran_page/widget/quran_page_widget.dart';
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
    return SafeArea(child: Scaffold(body: Consumer(
      builder: (context, watch, child) {
        final state = watch(homePageProvider);
        return state.maybeWhen(initial: () {
          return _widgetQuranPage();
        }, showInfo: () {
          return _widgetHalfNavigator(context);
        }, showFullNavigator: () {
          return _widgetFullNavigator(context);
        }, orElse: () {
          return Container();
        });
      },
    )));
  }

  //Action
  void _actionShowFullNavigator(BuildContext context) {
    context.read(homePageProvider.notifier).showNavigator();
  }

  void _actionHideNavigator(BuildContext context) {
    context.read(homePageProvider.notifier).hideNavigator();
  }

  //Widget
  Widget _widgetShowNavigator(BuildContext context) {
    return SizedBox(
        height: 18.0,
        width: 18.0,
        child: IconButton(
          icon: Icon(Icons.arrow_drop_up, color: Colors.black87),
          onPressed: () => {_actionShowFullNavigator(context)},
          padding: new EdgeInsets.all(0.0),
        ));
  }

  Widget _widgetHideNavigator(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SizedBox(
            height: 18.0,
            width: 18.0,
            child: IconButton(
                icon: Icon(Icons.arrow_drop_down, color: Colors.black87),
                onPressed: () => {_actionHideNavigator(context)},
                padding: new EdgeInsets.all(0.0))));
  }

  Widget _widgetAyahInfo() {
    return Consumer(
      builder: (context, watch, child) {
        final state = watch(quranPageProvider);

        return state.maybeWhen(loaded: (value) {
          return Text(
            "${S.of(context).page}: ${value.pageNumber}",
            style: TextStyle(
              fontSize: 18.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          );
        }, orElse: () {
          return Container();
        });
      },
    );
  }

  // Widget _bottomSlider() {
  //   return Container(
  //       decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
  //       child: Slider(
  //         divisions: constants.endQuranPageNumber,
  //         activeColor: Theme.of(context).primaryColorLight,
  //         inactiveColor: Theme.of(context).accentColor,
  //         min: constants.startQuranPageNumber.toDouble(),
  //         max: constants.endQuranPageNumber.toDouble(),
  //         onChanged: (newValue) {
  //           setState(() {
  //             _sliderValue = newValue.round();
  //           });
  //           BlocProvider.of<QuranPageBloc>(context)
  //             ..add(JumpToPageEvent(pageNumber: newValue.toInt()));
  //         },
  //         value: _quranPage.pageNumber.toDouble(),
  //         label: _quranPage.pageNumber.toString(),
  //       ));
  // }
  Widget _widgetQuranPage() {
    return QuranPageWidget();
  }

  Widget _widgetHalfNavigator(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).accentColor.withOpacity(.3)),
        _widgetQuranPage(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: _initialNavigatorWidget(context))
      ],
    );
  }

  Widget _widgetFullNavigator(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).accentColor.withOpacity(.3)),
        _widgetQuranPage(),
        Positioned(
            bottom: 0, left: 0, right: 0, child: _fullNavigatorWidget(context))
      ],
    );
  }

  Widget _initialNavigatorWidget(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              margin: EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: Theme.of(context).accentColor),
              child: Padding(
                  padding:
                      EdgeInsets.only(left: 16, top: 0, right: 16, bottom: 4),
                  child: Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        _widgetShowNavigator(context),
                        _widgetAyahInfo()
                      ])))),
          SizedBox(height: 10),
          //_bottomSlider()
        ]);
  }

  Widget _fullNavigatorWidget(BuildContext context) {
    return Container(
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Theme.of(context).accentColor),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      NavigatorWidget(),
                      SizedBox(height: 8),
                      _widgetHideNavigator(context),
                    ])),
          ]),
    );
  }
}
