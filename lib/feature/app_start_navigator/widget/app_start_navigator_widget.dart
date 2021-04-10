import 'package:flutter/material.dart';

class AppStartNavigatorWidget extends StatefulWidget {
  @override
  _AppStartNavigatorWidgetState createState() => _AppStartNavigatorWidgetState();
}

class _AppStartNavigatorWidgetState extends State<AppStartNavigatorWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('Download'),
        ),
      ),
    );
  }
}
