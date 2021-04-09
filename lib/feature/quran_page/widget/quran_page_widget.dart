import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/geature/easy_gesture_detector.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/common/widget/responsive_image_widget.dart';
import 'package:quran_reader/feature/home/model/home_page_notifier.dart';
import 'package:quran_reader/feature/quran_page/provider/index.dart';

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

  @override
  Widget build(BuildContext context) {
    return EasyGestureDetector(onTap: () {
      context.read(homePageProvider.notifier).viewTap();
    }, onSwipeLeft: () {
      context.read(quranPageProvider.notifier).leftNavigation();
      ;
    }, onSwipeRight: () {
      context.read(quranPageProvider.notifier).rightNavigation();
    },
        //Parent Container
        child: Consumer(
      builder: (context, watch, child) {
        final state = watch(quranPageProvider);
        print("QURAN PAGE $state");
        return state.maybeWhen(loaded: (value) {
          return _widgetQuranPage(state);
        }, orElse: () {
          return Container(
            child: Text('Page last'),
          );
        });
      },
    ));
  }

  Widget _widgetQuranPage(QuranPageState state) {
    return state.maybeWhen(loaded: (value) {
      if (Device.get().isWeb || Device.get().isComputer) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            // if (state.secondQuranPage != null)
            //   Expanded(
            //     flex: 1,
            //     child: Container(
            //         child:
            //             ResponsiveImageWidget(quranPage: state.secondQuranPage!)),
            //   )
            // else
            //   Container(),
            Expanded(
              flex: 1,
              child: Container(child: ResponsiveImageWidget(quranPage: value)),
            ),
          ],
        );
      } else {
        return ResponsiveImageWidget(quranPage: value);
      }
    }, orElse: () {
      return Container();
    });
  }
}
