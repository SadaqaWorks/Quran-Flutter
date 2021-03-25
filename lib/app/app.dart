import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quran_reader/common/bloc/appconfig/appconfig_bloc.dart';
import 'package:quran_reader/common/bloc/appconfig/appconfig_state.dart';
import 'package:quran_reader/common/database/ayah_info_service.dart';
import 'package:quran_reader/common/database/database.dart';
import 'package:quran_reader/common/routes/route_generator.dart';
import 'package:quran_reader/common/routes/routes.dart';
import 'package:quran_reader/generated/l10n.dart';

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
    return MultiRepositoryProvider(
        providers: [
          RepositoryProvider<AyahInfoRepository>(
            create: (context) => AyahInfoRepository(),
            lazy: true,
          ),
        ],
        child: MultiBlocProvider(
            providers: [
              BlocProvider<AppConfigBloc>(
                create: (BuildContext context) => AppConfigBloc(),
              )
            ],
            child: BlocBuilder<AppConfigBloc, AppConfigState>(
                builder: (BuildContext context, AppConfigState appConfigState) {
              if (appConfigState is AppConfigStateStarted) {
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates: [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                    DefaultCupertinoLocalizations.delegate,
                    S.delegate
                  ],
                  locale: appConfigState.locale,
                  title: 'Quran',
                  theme: appConfigState.theme,
                  onGenerateRoute: RouteGenerator.generateRoute,
                  initialRoute: Routes.home,
                );
              }

              return MaterialApp(
                debugShowCheckedModeBanner: false,
                localizationsDelegates: [
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate,
                  DefaultCupertinoLocalizations.delegate,
                  S.delegate
                ],
                title: 'Quran',
                onGenerateRoute: RouteGenerator.generateRoute,
                initialRoute: Routes.home,
              );
            })));
  }
}
