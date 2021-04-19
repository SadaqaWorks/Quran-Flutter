import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_reader/feature/home/ui/widget/home_page_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: HomePageWidget()));
  }
}
