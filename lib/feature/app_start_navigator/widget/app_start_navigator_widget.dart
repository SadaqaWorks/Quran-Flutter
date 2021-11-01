import 'package:flutter/material.dart';
import 'package:quran_reader/l10n/l10n.dart';

class AppStartNavigatorWidget extends StatefulWidget {
  @override
  _AppStartNavigatorWidgetState createState() =>
      _AppStartNavigatorWidgetState();
}

class _AppStartNavigatorWidgetState extends State<AppStartNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Text(context.l10n.surah_1),
          ),
        ),
      ),
    );
  }
}
