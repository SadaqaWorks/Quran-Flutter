import 'package:flutter/material.dart';

import 'package:quran/feature/home/page/home_page.dart';
import 'package:quran/feature/landing/landing_page.dart';


import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.landing:
        return MaterialPageRoute<dynamic>(builder: (_) => LandingPage());

      case Routes.home:
        return MaterialPageRoute<dynamic>(
            builder: (_) => Scaffold(
                appBar: AppBar(
                  title: const Text('Books'),
                ),
                body: HomePage()));
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute<dynamic>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
