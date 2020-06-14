import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/database/ayah_info_service.dart';
import 'package:quran_reader/common/routes/route_generator.dart';
import 'package:quran_reader/common/routes/routes.dart';
import 'package:quran_reader/generated/i18n.dart';

import '../common/theme/theme.dart';

class App extends StatefulWidget {
  App({Key key, @required this.ayahInfoService}) : super(key: key);

  final AyahInfoService ayahInfoService;

  @override
  _MyAppState createState() {
    return _MyAppState(ayahInfoService: ayahInfoService);
  }
}

class _MyAppState extends State<App> {
  _MyAppState({@required this.ayahInfoService});

  final AyahInfoService ayahInfoService;

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
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AyahInfoService>(
          create: (context) => ayahInfoService,
          lazy: true,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: true,
        localizationsDelegates: const <
            LocalizationsDelegate<WidgetsLocalizations>>[
          S.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        localeResolutionCallback:
            S.delegate.resolution(fallback: const Locale('en', '')),
        localeListResolutionCallback:
            S.delegate.listResolution(fallback: const Locale('en', '')),
        title: 'Quran',
        theme: basicTheme,
        onGenerateRoute: RouteGenerator.generateRoute,
        initialRoute: Routes.home,
      ),
    );
  }
}
