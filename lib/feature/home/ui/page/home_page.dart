import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/home_page_widget.dart';


class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
        providers: [
          BlocProvider<HomePageBloc>(
            create: (context) {
              return HomePageBloc();
            },
          ),
          BlocProvider<QuranPageBloc>(
            create: (context) {
              return QuranPageBloc();
            },
          ),
        ],
        child: HomePageWidget());
  }
}
