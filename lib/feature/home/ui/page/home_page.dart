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
              body: BlocBuilder<HomePageBloc,HomePageState>(
                builder: (context,state){

                  if (state is HomePageShowView){

                 return Column(
                    children: <Widget>[
                      Flexible(
                        flex: 1,
                        child: ConstrainedBox(
                            constraints: BoxConstraints.expand(),
                            child:  Card(
                              color: Theme.of(context).primaryColor,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  IconButton(
                                    icon: Icon(Icons.menu),
                                    onPressed: (){
                                      BlocProvider.of<HomePageBloc>(context).add(HomePageMenuTapped());
                                    },
                                  ),
                                  BlocBuilder<QuranPageBloc,QuranPageState>(
                                    builder: (context,state){
                                      if (state is QuranPageLoaded){
                                        Text("Page: ${state.quranPage.page}");
                                      }

                                      return Container();
                                    },
                                  )
                                ],
                              ),
                            )),
                      ),
                      Flexible(flex: 9, child: QuranPageWidget()),
//              Flexible(
//                  flex: 1,
//                  child: ConstrainedBox(
//                    constraints: BoxConstraints.expand(),
//                    child:  Row(
//                      children: <Widget>[
//
//                      ],
//                    ),
//                  )),
                    ],
                  );}else{
                    return QuranPageWidget();
                  }

                }
              )),
        ));
  }
}
