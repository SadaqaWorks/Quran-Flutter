import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/constant/constants.dart' as Constants;
import 'package:quran/common/routes/routes.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/quran_page_widget.dart';
import 'package:wakelock/wakelock.dart';
import 'package:quran/common/util/flutter_device_type.dart';

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
    // TODO: implement didChangeDependencies
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
    return Column(
      children: <Widget>[
        Flexible(flex: 9, child: QuranPageWidget()),
        Flexible(
          flex: 1,
          child: ConstrainedBox(
              constraints: BoxConstraints.expand(),
              child:
              BlocConsumer<QuranPageBloc, QuranPageState>(
                  listener: (context, state) {
                if (state is QuranPageLoaded) {}
              }, builder: (context, state) {

                if (state is QuranPageLoaded || state is QuranPageJumpedTo) {
                  double _quranPage;

                  if (state is QuranPageLoaded) {
                    _quranPage =
                        (state as QuranPageLoaded).quranPage.page.toDouble() + 1;
                  }

                  if (state is QuranPageJumpedTo) {
                    _quranPage =
                        (state as QuranPageJumpedTo).quranPage.page.toDouble() + 1;
                  }

                  return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                  Flexible(
                  child: Text("${_quranPage.truncate()}")
                  ),
                        Flexible(
                          child: Slider(
                            divisions: Constants.endQuranPageNumber,
                            activeColor: Colors.red,
                            min: Constants.startQuranPageNumber.toDouble(),
                            max: Constants.endQuranPageNumber.toDouble(),
                            onChanged: (newValue) {
                              BlocProvider.of<QuranPageBloc>(context)
                                ..add(JumpToPage(pageNumber: newValue.toInt()));
                            },
                            value: _quranPage.toDouble(),
                            label: _quranPage.truncate().toString(),
                          ),
                          flex: 3,
                        )
                      ]);
                }

                return Container();
              })
          ),
        )
      ],
    );
  }
}
