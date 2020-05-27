import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/constant/constants.dart' as constants;
import 'package:quran/common/util/flutter_device_type.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/responsive_image_widget.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  PageController _controller;
  QuranPageBloc _quranPageBloc;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _onPageViewChange(int page) {
    BlocProvider.of<QuranPageBloc>(context).add(LoadPage(pageNumber: page));
  }

  @override
  Widget build(BuildContext context) {
    _quranPageBloc = BlocProvider.of<QuranPageBloc>(context);

    if (_quranPageBloc.initialState is QuranPageJumpedTo) {
      final initialPage =
          (_quranPageBloc.initialState as QuranPageJumpedTo).quranPage.page;
      _controller = PageController(initialPage: initialPage);
    }

    return BlocConsumer<QuranPageBloc, QuranPageState>(
      listener: (context, state) {
        if (state is QuranPageJumpedTo) {
          _controller.animateToPage(state.quranPage.page,
              duration: null, curve: null);
        }
      },
      builder: (context, state) {
        return PageView.builder(
            itemBuilder: (context, index) {
              if (Device.get().isWeb || Device.get().isComputer) {
                final firstIndex = index + 2;
                final secondIndex = index + 1;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                        flex: 1,
                        child: ResponsiveImageWidget(
                            quranPage: BlocProvider.of<QuranPageBloc>(context)
                                .fetchQuranPage(firstIndex))),
                    Expanded(
                        flex: 1,
                        child: ResponsiveImageWidget(
                            quranPage: BlocProvider.of<QuranPageBloc>(context)
                                .fetchQuranPage(secondIndex)))
                  ],
                );
              } else {
                return ResponsiveImageWidget(
                    quranPage: BlocProvider.of<QuranPageBloc>(context)
                        .fetchQuranPage(index + 1));
              }
            },
            reverse: true,
            onPageChanged: _onPageViewChange,
            itemCount: constants.endQuranPageNumber,
            controller: _controller);
      },
    );
  }
}
