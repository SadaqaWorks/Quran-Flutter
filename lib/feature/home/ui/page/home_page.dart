import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/database/database.dart';
import 'package:quran_reader/feature/home/bloc/blocs.dart';
import 'package:quran_reader/feature/home/ui/widget/home_page_widget.dart';
import 'package:quran_reader/feature/quran_page/bloc/blocs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
    BlocProvider<QuranPageBloc>(
    create: (context) {
      return QuranPageBloc(
          ayahInfoService: RepositoryProvider.of<AyahInfoService>(context));
    },
    ),
      BlocProvider<HomePageBloc>(
        create: (context) {
          return HomePageBloc(quranPageBloc: RepositoryProvider.of<QuranPageBloc>(context));
        },
      ),

    ], child: HomePageWidget());
  }
}
