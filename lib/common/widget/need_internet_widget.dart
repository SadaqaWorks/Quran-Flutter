import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class NeedInternetWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () {
              AppSettings.openWIFISettings();
            },
            child: Text('Enable Internet'),
          ),
        ),
      ),
    );
  }
}
