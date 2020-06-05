import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/constant/constants.dart' as constants;
import 'package:quran/common/routes/routes.dart';
import 'package:quran/common/util/flutter_device_type.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/quran_page_widget.dart';
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
        listener: (context, state) {
      if (state is HomePageShowSideView) {
        Navigator.pushNamed(context, Routes.sideView);
      }
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(body:
            BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
          if (state is HomePageShowView) {
            return flexedView();
          } else {
            return QuranPageWidget();
          }
        })),
      );
    });
  }

  Widget flexedView() {
    return Stack(
      children: <Widget>[
        QuranPageWidget(),
        Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: BlocConsumer<QuranPageBloc, QuranPageState>(
                  listener: (context, state) {
                if (state is QuranPageLoaded) {}
              }, builder: (context, state) {
                if (state is QuranPageLoaded || state is QuranPageJumpedTo) {
                  double _quranPage;

                  if (state is QuranPageLoaded) {
                    _quranPage = state.quranPage.page.toDouble() + 1;
                  }

                  if (state is QuranPageJumpedTo) {
                    _quranPage = state.quranPage.page.toDouble() + 1;
                  }

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor),
                            child: Padding(
                                padding: EdgeInsets.only(
                                    left: 16, top: 4, right: 16, bottom: 4),
                                child: Container(
                                    child: Text(
                                  "${_quranPage.truncate()}",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )))),
                        SizedBox(height: 10),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.3)),
                            child: Slider(
                              divisions: constants.endQuranPageNumber,
                              activeColor: Theme.of(context).primaryColor,
                              inactiveColor: Theme.of(context).accentColor,
                              min: constants.startQuranPageNumber.toDouble(),
                              max: constants.endQuranPageNumber.toDouble(),
                              onChanged: (newValue) {
                                BlocProvider.of<QuranPageBloc>(context)
                                  ..add(
                                      JumpToPage(pageNumber: newValue.toInt()));
                              },
                              value: _quranPage.toDouble(),
                              label: _quranPage.truncate().toString(),
                            ))
                      ]);
                }

                return Container();
              }),
            ))
      ],
    );
  }
}
