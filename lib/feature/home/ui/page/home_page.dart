import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/quran_page_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranPageBloc>(
      create: (_) => QuranPageBloc(),
      child: Scaffold(
        body: QuranPageWidget(),
      ),
    );
  }
}
