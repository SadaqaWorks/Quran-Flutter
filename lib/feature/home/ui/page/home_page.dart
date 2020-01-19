import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/quran_page_widget.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<QuranPageBloc>(
        create: (_) => QuranPageBloc(),
        child: SafeArea(
          child: Scaffold(
              body: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: ConstrainedBox(
                  constraints: BoxConstraints.expand(),
                  child: Row(
                    children: <Widget>[
                      
                    ],
                  ),
                ),
              ),
              Flexible(flex: 8, child: QuranPageWidget()),
              Flexible(
                  flex: 1,
                  child: ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: const Card(
                      child: const Text('Hello World!'),
                      color: Colors.yellow,
                    ),
                  )),
            ],
          )),
        ));
  }
}
