import 'package:flutter/material.dart';
import 'package:quran/common/constant/constants.dart' as constants;

final ThemeData basicTheme = _buildBasicTheme();

TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    title: base.title.copyWith(
      fontFamily: 'GoogleSans',
    ),
  );
}

ThemeData _buildBasicTheme() {
  const Color primaryColor = constants.primaryColor;
  const Color secondaryColor = constants.secondaryColor;
  const Color colorPrimaryDark = constants.primaryColorDark;
  const Color accentColor = constants.accentColor;

  final ColorScheme colorScheme = const ColorScheme.light().copyWith(
    primary: primaryColor,
    secondary: secondaryColor,
  );
  final ThemeData base = ThemeData(
//    brightness: Brightness.light,
//    accentColorBrightness: Brightness.light,
    primaryColor: primaryColor,
    //primaryColorDark: const Color(0xFF0050a0),
    primaryColorLight: secondaryColor,
    buttonColor: primaryColor,
    indicatorColor: Colors.white,
    toggleableActiveColor: primaryColor,
    accentColor: accentColor,
    //canvasColor: const Color(0xFF202124),
    //scaffoldBackgroundColor: const Color(0xFF202124),
    //backgroundColor: const Color(0xFF202124),
    errorColor: Colors.red,
    primaryColorDark: colorPrimaryDark,
    buttonTheme: ButtonThemeData(
      colorScheme: colorScheme,
      textTheme: ButtonTextTheme.primary,
    ),
  );
  return base.copyWith(
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}
