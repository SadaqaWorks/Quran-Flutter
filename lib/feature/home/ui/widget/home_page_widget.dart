import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/constant/constants.dart' as constants;
import 'package:quran_reader/common/routes/routes.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/feature/home/bloc/index.dart';
import 'package:quran_reader/feature/home/model/quran_page.dart';
import 'package:quran_reader/feature/home/ui/widget/quran_page_widget.dart';
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
            return fullWidget();
          } else {
            debugPrint(
                "QuranPageBloc: ${BlocProvider.of<QuranPageBloc>(context)}");
            return QuranPageWidget();
          }
        })),
      );
    });
  }

  Widget fullWidget() {
    return Stack(
      children: <Widget>[
        Container(color: Theme.of(context).accentColor.withOpacity(.3)),
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
                  QuranPage _quranPage;

                  if (state is QuranPageLoaded) {
                    _quranPage = state.quranPage; //.page.toDouble() + 1;
                    _quranPage.page = _quranPage.page + 1;
                  }

                  if (state is QuranPageJumpedTo) {
                    _quranPage = state.quranPage; //.page.toDouble() + 1;
                    _quranPage.page = _quranPage.page + 1;
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
                                  "${_quranPage.quranPageInfoList.first.nameEnglish} (${_quranPage.quranPageInfoList.first.suraNumber}) ${_quranPage.page}",
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
                              activeColor: Theme.of(context).primaryColorLight,
                              inactiveColor: Theme.of(context).accentColor,
                              min: constants.startQuranPageNumber.toDouble(),
                              max: constants.endQuranPageNumber.toDouble(),
                              onChanged: (newValue) {
                                BlocProvider.of<QuranPageBloc>(context)
                                  ..add(
                                      JumpToPage(pageNumber: newValue.toInt()));
                              },
                              value: _quranPage.page.toDouble(),
                              label: _quranPage.page.toString(),
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
