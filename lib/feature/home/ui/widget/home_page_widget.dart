import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran/common/constant/constants.dart' as Constants;
import 'package:quran/feature/home/bloc/index.dart';
import 'package:quran/feature/home/ui/widget/quran_page_widget.dart';

class HomePageWidget extends StatefulWidget {
  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  HomePageBloc _homePageBloc;
  @override
  void dispose() {
    _homePageBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _homePageBloc = BlocProvider.of<HomePageBloc>(context);

    return BlocConsumer<HomePageBloc, HomePageState>(
        listener: (context, state) {
      // do stuff here based on BlocA's state
      debugPrint('HomePageWidget listner ${state} ');
      final snackBar = SnackBar(content: Text("Tap"));
      Scaffold.of(context).showSnackBar(snackBar);
    }, builder: (context, state) {
      return SafeArea(
        child: Scaffold(body:
            BlocBuilder<HomePageBloc, HomePageState>(builder: (context, state) {
          debugPrint('HomePageWidget page ${state} ');
          //if (state is HomePageShowView) {
            return Column(
              children: <Widget>[
                Flexible(
                  flex: 1,
                  child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            BlocBuilder<QuranPageBloc, QuranPageState>(
                              builder: (context, state) {
                                if (state is QuranPageLoaded) {
                                  return Text("Page: ${state.quranPage.page}");
                                }
                                return Container();
                              },
                            ),
                            IconButton(
                              icon: Icon(Icons.menu),
                              onPressed: () {
                                BlocProvider.of<HomePageBloc>(context)
                                    .add(HomePageMenuTapped());
                              },
                            )
                          ],
                        ),
                      )),
                ),
                Flexible(flex: 9, child: QuranPageWidget()),
                Flexible(
                  flex: 1,
                  child: ConstrainedBox(
                      constraints: BoxConstraints.expand(),
                      child: BlocConsumer<QuranPageBloc, QuranPageState>(

                        listener: (context, state) {
    if (state is QuranPageLoaded) {

    }
    },
                          builder: (context, state) {
                        if (state is QuranPageLoaded) {
                          return

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Flexible(
                                    child: Text("${state.quranPage.page}"),
                                    flex: 1,
                                  ),
                                  Flexible(
                                    child:   Slider(
                                      activeColor: Theme.of(context).accentColor,
                                      min: Constants.startQuranPageNumber.toDouble(),
                                      max: Constants.endQuranPageNumber.toDouble(),
                                      onChanged: (newValue) {
                                        BlocProvider.of<QuranPageBloc>(context)
                                          ..add(JumpToPage(pageNumber: newValue.toInt()));
                                      },
                                      value: state.quranPage.page.toDouble(),
                                    ),
                                    flex: 3,
                                  )


                            ]);
                        }

                        return Container();
                      }
                      )),
                )
              ],
            );
//          } else {
//            return SafeArea(child: Scaffold(body: QuranPageWidget()));
//          }
        })),
      );
    });
  }
}
