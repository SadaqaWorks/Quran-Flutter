import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/bloc/page_bloc.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  PageBloc _pageBloc;
  @override
  void dispose() {
    _pageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pageBloc = BlocProvider.of<PageBloc>(context);
    return BlocBuilder<PageBloc, int>(
      builder: (context, current) {
        print(current);
        return PageView.builder(
          controller: PageController(initialPage: current, keepPage: false),
          itemCount: 605,
          onPageChanged: (int index) {
            setState(() {
              _pageBloc.add(index);
            });
          },
          itemBuilder: (context, index) {
            return Container(
              child: Image.asset(
                'assets/images/quran/image${index + 1}.png',
              ),
            );
          },
        );
      },
    );
  }
}
