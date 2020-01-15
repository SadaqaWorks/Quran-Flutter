import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:swipedetector/swipedetector.dart';
import 'package:quran/feature/home/page/bloc/page_bloc.dart';
import 'package:quran/feature/home/model/page_model.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  PageBloc _pageBloc;
  final _maxSize = 605;
  final _minSize = 1;
  @override
  void dispose() {
    _pageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<PageBloc>(context);
    return BlocBuilder<PageBloc, PageModel>(
      builder: (context, current) {
        return SwipeDetector(
          onSwipeLeft: () {
            setState(() {
              _pageBloc.add(
                min(current.page + 1, _maxSize),
              );
            });
          },
          onSwipeRight: () {
            setState(() {
              _pageBloc.add(
                max(current.page - 1, _minSize),
              );
            });
          },
          child: Container(
            child: Center(
              child: Image.asset(current.imageUrl),
            ),
          ),
        );
      },
    );
  }
}
