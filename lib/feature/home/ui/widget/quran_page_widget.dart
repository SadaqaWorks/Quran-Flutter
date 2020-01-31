import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/swipedetector.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/responsive_image_widget.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  QuranPageBloc _pageBloc;

  @override
  void dispose() {
    _pageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<QuranPageBloc>(context);
    return BlocBuilder<QuranPageBloc, QuranPageState>(
      builder: (context, state) {
        if (state is QuranPageLoaded) {
          return SwipeDetector(
            onSwipeLeft: () {
              _pageBloc.add(ShowBackwardPage());
            },
            onSwipeRight: () {
              _pageBloc.add(ShowForwardPage());

            },
            child: GestureDetector(
                onTap: () {
                  debugPrint("TAPPED");
                  BlocProvider.of<HomePageBloc>(context)..add(HomePageViewTapped());
                }, child:
                  ResponsiveImageWidget(quranPage: state.quranPage)
            )

          );
        } else if (state is QuranPageBackward) {
          //TODO:- show page flip from left
          return Container();
        } else if (state is QuranPageForward) {
          //TODO:- show page flip from right
          return Container();
        } else {
          return Container();
        }
      },
    );
  }
}
