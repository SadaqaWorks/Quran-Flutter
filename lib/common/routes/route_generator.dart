import 'package:flutter/material.dart';
import 'package:quran/feature/home/ui/page/home_page.dart';
import 'package:quran/feature/sideview/ui/page/SideViewPage.dart';

import 'routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {

    final args = settings.arguments;


    switch (settings.name) {

      case Routes.home:
        return MaterialPageRoute<dynamic>(
          builder: (_) => HomePage(),
        );

      case Routes.sideView:
        return MaterialPageRoute<dynamic>(
          builder: (_) => SideViewPage(),
        );

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
