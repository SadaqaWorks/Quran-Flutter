import 'package:flutter/material.dart';
import 'package:quran_reader/common/util/flutter_device_type.dart';
import 'package:quran_reader/feature/quran_page/model/models.dart';

class InheritedOrientedImage extends InheritedWidget {
  final QuranPage quranPage;

  InheritedOrientedImage({required this.quranPage, required Widget child})
      : super(child: child);

  @override
  bool updateShouldNotify(InheritedOrientedImage old) {
    return quranPage != old.quranPage;
  }

  static QuranPage of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<InheritedOrientedImage>()!
        .quranPage;
  }
}

class ResponsiveImageWidget extends StatelessWidget {
  final QuranPage quranPage;

  ResponsiveImageWidget({required this.quranPage});

  @override
  Widget build(BuildContext context) {
    return InheritedOrientedImage(
      quranPage: quranPage,
      child: OrientationBuilder(builder: (context, orientation) {
        return PortraitImageWidget();

        orientation == Orientation.portrait
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
    return Container(
        height: double.infinity,
        child: Image(
          image: AssetImage(quranPage!),
        ));

    if (Device.get().isPhone) {
      return Container(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.green, width: 1.0, style: BorderStyle.solid)),
          child: Image(image: AssetImage(quranPage), height: double.infinity));

      final double width = MediaQuery.of(context).size.width;
      final double height = MediaQuery.of(context).size.height;

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
      ));
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
        quranPage.imageUrl!,
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
