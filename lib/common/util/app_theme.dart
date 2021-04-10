import 'package:flutter/material.dart';
import 'package:quran_reader/common/constant/constants.dart' as constants;

class AppTheme {
  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      subtitle1: base.subtitle1!.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );
  }

  ThemeData defaultTheme() {
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
      indicatorColor: Colors.black,
      toggleableActiveColor: primaryColor,
      accentColor: accentColor,
      appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
        color: Colors.white, //change your color here
      )),
      primaryColorDark: colorPrimaryDark,
      buttonTheme: ButtonThemeData(
        buttonColor: primaryColor,
        textTheme: ButtonTextTheme.accent,
        colorScheme: colorScheme.copyWith(secondary: Colors.white),
      ),

      inputDecorationTheme: const InputDecorationTheme(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: secondaryColor),
        ),
      ),

      //canvasColor: const Color(0xFF202124),
      //scaffoldBackgroundColor: const Color(0xFF202124),
      //backgroundColor: const Color(0xFF202124),
      errorColor: Colors.red,
    );
    return base.copyWith(
      textTheme: _buildTextTheme(base.textTheme),
      primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
      accentTextTheme: _buildTextTheme(base.accentTextTheme),
    );
  }
}
