import 'package:flutter/material.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/feature/home/model/quran_page.dart';

class InheritedOrientedImage extends InheritedWidget {
  final QuranPage quranPage;

  InheritedOrientedImage({@required this.quranPage, Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedOrientedImage old) {
    return quranPage != old.quranPage;
  }

  static QuranPage of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedOrientedImage>()
        .quranPage;
  }
}

class ResponsiveImageWidget extends StatelessWidget {
  final QuranPage quranPage;

  ResponsiveImageWidget({@required this.quranPage});

  @override
  Widget build(BuildContext context) {
    return InheritedOrientedImage(
      quranPage: quranPage,
      child: OrientationBuilder(builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? PortraitImageWidget()
            : LandscapeImageWidget();
      }),
    );
  }
}

class PortraitImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final quranPage = InheritedOrientedImage.of(context).imageUrl;

    if (Device.get().isPhone) {
      final double width = MediaQuery.of(context).size.width + 80;
      final double height = MediaQuery.of(context).size.height - 20;

      return Container(
          child: OverflowBox(
              minWidth: width,
              maxWidth: width,
              maxHeight: height,
              minHeight: height,
              child: ClipPath(
                child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image(
                        image: AssetImage(quranPage),
                        height: double.infinity,
                        fit: BoxFit.fill)),
                clipper: RectangleImageClipper(),
              )));
    } else {
      return Container(
          child: Image(
              image: AssetImage(quranPage),
              height: double.infinity,
              fit: BoxFit.fill));
    }
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
        width: double.infinity,
      ),
    );
  }
}

class RectangleImageClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();

    //Cut 6.5% left and right side of Image
    double cutPercentage = 6.5;
    double cutPixel = (cutPercentage * size.width) / 100;

    path.moveTo(cutPixel, 0.0);
    path.lineTo(size.width - cutPixel, 0.0);
    path.lineTo(size.width - cutPixel, size.height);
    path.lineTo(cutPixel, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
