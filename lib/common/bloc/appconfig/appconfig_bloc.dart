import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:quran_reader/common/constant/constants.dart' as constants;
import 'package:shared_preferences/shared_preferences.dart';

import './bloc.dart';

class AppConfigBloc extends Bloc<AppConfigEvent, AppConfigState> {
  AppConfigBloc() {
    add(AppStarted());
  }

  @override
  AppConfigState get initialState {
    return AppConfigState(
        theme: _buildDefaultTheme(), locale: const Locale('en'));
  }

  @override
  Stream<AppConfigState> mapEventToState(
    AppConfigEvent event,
  ) async* {
    if (event is AppStarted) {
      yield* _mapAppStarted();
    }

    if (event is ThemeChanged) {
      yield* _mapThemeChanged(event.themeType);
    }
    if (event is LanguageChanged) {
      yield* _mapLanguageChanged(event.languageType);
    }
  }

  Stream<AppConfigState> _mapAppStarted() async* {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (!prefs.containsKey(constants.Locale.locale)) {
      yield AppConfigState(
          theme: _buildDefaultTheme(),
          locale: const Locale(constants.Locale.en));
    } else {
      yield AppConfigState(
          theme: _buildDefaultTheme(),
          locale: Locale(prefs.getString(constants.Locale.locale)));
    }
  }

  Stream<AppConfigState> _mapLanguageChanged(LanguageType languageType) async* {
    AppConfigState appConfigState;
    switch (languageType) {
      case LanguageType.bangla:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(constants.Locale.locale, constants.Locale.bn);
        appConfigState = AppConfigState(
            theme: state.theme, locale: const Locale(constants.Locale.bn));
        break;
      case LanguageType.english:
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString(constants.Locale.locale, constants.Locale.en);
        appConfigState = AppConfigState(
            theme: state.theme, locale: const Locale(constants.Locale.en));
        break;
    }

    yield appConfigState;
  }

  Stream<AppConfigState> _mapThemeChanged(ThemeType changedTheme) async* {
    AppConfigState appConfigState;

    switch (changedTheme) {
      case ThemeType.normal:
        appConfigState =
            AppConfigState(theme: _buildDefaultTheme(), locale: state.locale);
        break;
    }
    yield appConfigState;
  }

  TextTheme _buildTextTheme(TextTheme base) {
    return base.copyWith(
      subtitle1: base.subtitle1.copyWith(
        fontFamily: 'GoogleSans',
      ),
    );
  }

  ThemeData _buildDefaultTheme() {
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
