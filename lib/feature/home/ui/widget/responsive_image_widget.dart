import 'package:flutter/material.dart';
import 'package:quran/feature/home/model/quran_page.dart';

class InheritedOrientedImage extends InheritedWidget{
  final QuranPage quranPage;
  InheritedOrientedImage({
      @required this.quranPage,
      Widget child}): super(child: child);

  @override
  bool updateShouldNotify(InheritedOrientedImage old) {
    return quranPage != old.quranPage;
  }

  static QuranPage of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedOrientedImage>().quranPage;
  }
}


class ResponsiveImageWidget extends StatelessWidget {
  final QuranPage quranPage;
  ResponsiveImageWidget({@required this.quranPage});
  @override
  Widget build(BuildContext context) {
    return InheritedOrientedImage(
      quranPage: quranPage,
      child: OrientationBuilder(
          builder: (context, orientation) {
            return orientation == Orientation.portrait
                ? PortraitImageWidget() : LandscapeImageWidget();
          }
      ),
    );
  }
}

class PortraitImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final quranPage = InheritedOrientedImage.of(context);

    return Container(
      child: Center(
        child: Image.asset(quranPage.imageUrl, height: double.infinity, fit: BoxFit.fill,),
      ),
    );
  }
}

class LandscapeImageWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final quranPage = InheritedOrientedImage.of(context);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Image.asset(
        quranPage.imageUrl,
        fit: BoxFit.fill,
        width: double.infinity,),
    );
  }
}



