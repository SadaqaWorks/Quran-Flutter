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
    //ScreenUtil.init(context, width: 750, height: 1334, allowFontScaling: false);

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
              final quranPage = BlocProvider.of<QuranPageBloc>(context)
                  .fetchQuranPage(index)
                  .imageUrl;
              final double width = MediaQuery.of(context).size.width;
              final double height = MediaQuery.of(context).size.height - 75;

              debugPrint("");
//            return  OverflowBox(
//                minWidth: width,
//                maxWidth: width,
//                maxHeight: height,
//                minHeight: height,
//
//                child: ClipPath(
//
//                child:  AspectRatio(
//                    aspectRatio: 16 / 9,
//                    child: Image.asset(quranPage,
//                        height: double.infinity, fit: BoxFit.fill)
//                ),
//                clipper: RectangleImageClipper(),
//              ));

//             return AspectRatio(
//                  aspectRatio: 16 / 9,
//                  child: Image.asset(quranPage,
//                      height: double.infinity, fit: BoxFit.fill)
//              );

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
