import 'package:flutter/material.dart';

class AppJourneyStartWidget extends StatefulWidget {
  @override
  _AppJourneyStartWidgetState createState() => _AppJourneyStartWidgetState();
}

class _AppJourneyStartWidgetState extends State<AppJourneyStartWidget> {
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
