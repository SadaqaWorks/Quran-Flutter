import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseLoadingView extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
          padding: EdgeInsets.all(16.0),
          child:CircularProgressIndicator()),
    );
  }
}
