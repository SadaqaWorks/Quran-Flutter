import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quran_reader/common/geature/easy_gesture_detector.dart';
import 'package:quran_reader/feature/home/provider/index.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';
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
        return state.maybeWhen(loaded: (url) {
          return _widgetQuranPage(state);
        }, orElse: () {
          return Container();
        });
      },
    ));
  }

  Widget _widgetQuranPage(QuranPageState state) {
    return state.maybeWhen(loaded: (page) {
      return page.imageFile.loadPolicy == ImageLoadPolicy.cache
          ? Container(
              height: double.infinity,
              child: Image(
                image: AssetImage(page.imageFile.imageUrl),
              ))
          : Container(
              height: double.infinity,
              child: Image.network(page.imageFile.imageUrl));
    }, orElse: () {
      return Container();
    });
  }
}
