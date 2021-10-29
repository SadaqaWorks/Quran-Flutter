import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_reader/common/routes/route_generator.dart';
import 'package:quran_reader/common/util/app_theme.dart';
import 'package:quran_reader/feature/app_start_up/widget/app_startup_page.dart';
import 'package:quran_reader/l10n/l10n.dart';

class App extends StatefulWidget {
  App({Key? key}) : super(key: key);

  @override
  _MyAppState createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<App> {
  _MyAppState();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: AppLocalizations.supportedLocales,
      title: 'Quran',
      theme: AppTheme().defaultTheme(),
      onGenerateRoute: RouteGenerator.generateRoute,
      home: AppStartupPage(),
      //initialRoute: Routes.auth,
    );
  }
}
