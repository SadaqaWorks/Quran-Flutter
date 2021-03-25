import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/geature/easy_gesture_detector.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/common/widget/responsive_image_widget.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  _onPageViewChange(int page) {
    BlocProvider.of<QuranPageBloc>(context)
        .add(QuranPageEventLoad(pageNumber: page));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<QuranPageBloc, QuranPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is QuranPageStateLoaded) {
          return EasyGestureDetector(
              onTap: () {
                BlocProvider.of<HomePageBloc>(context)
                    .add(HomePageEventViewTap());
              },
              // gestures: {
              //   AllowMultipleGestureRecognizer: GestureRecognizerFactoryWithHandlers<
              //       AllowMultipleGestureRecognizer>(
              //     () => AllowMultipleGestureRecognizer(),
              //     (AllowMultipleGestureRecognizer instance) {
              //       instance.onTap = () => {
              //             BlocProvider.of<HomePageBloc>(context)
              //                 .add(HomePageViewTappedEvent())
              //           };
              //     },
              //   )
              // },
              onSwipeLeft: () {
                _onPageViewChange(state.firstQuranPage.pageNumber - 1);
              },
              onSwipeRight: () {
                _onPageViewChange(state.firstQuranPage.pageNumber + 1);
              },
              //Parent Container
              child: _widgetQuranPage(state));
        }
        return Container(
          color: Colors.black26,
        );
      },
    );
  }

  Widget _widgetQuranPage(QuranPageStateLoaded state) {
    if (Device.get().isWeb || Device.get().isComputer) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          if (state.secondQuranPage != null)
            Expanded(
              flex: 1,
              child: Container(
                  child:
                      ResponsiveImageWidget(quranPage: state.secondQuranPage!)),
            )
          else
            Container(),
          Expanded(
            flex: 1,
            child: Container(
                child: ResponsiveImageWidget(quranPage: state.firstQuranPage)),
          ),
        ],
      );
    } else {
      return ResponsiveImageWidget(quranPage: state.firstQuranPage);
    }
  }
}
