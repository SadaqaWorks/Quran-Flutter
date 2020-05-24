import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/constant/constants.dart' as constants;
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/responsive_image_widget.dart';

class QuranPageWidget extends StatefulWidget {
  @override
  _QuranPageWidgetState createState() => _QuranPageWidgetState();
}

class _QuranPageWidgetState extends State<QuranPageWidget> {
  PageController _controller = PageController(
    initialPage: constants.startQuranPageNumber,
  );

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
              return ResponsiveImageWidget(
                  quranPage: BlocProvider.of<QuranPageBloc>(context)
                      .fetchQuranPage(index));
            },
            reverse: true,
            onPageChanged: _onPageViewChange,
            itemCount: constants.endQuranPageNumber,
            controller: _controller);
      },
    );
  }
}
