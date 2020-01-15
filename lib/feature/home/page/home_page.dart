import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/page/bloc/page_bloc.dart';
import 'package:quran/feature/home/widget/quran_page_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PageBloc>(
      create: (_) => PageBloc(),
      child: Scaffold(
        body: QuranPageWidget(),
      ),
    );
  }
}
