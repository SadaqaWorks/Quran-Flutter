import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_reader/common/resource/database.dart';
import 'package:quran_reader/feature/navigator/bloc/blocs.dart';
import 'package:quran_reader/generated/l10n.dart';

class NavigatorWidget extends StatefulWidget {
  @override
  _NavigatorWidgetState createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int? _selectedIndex = 0;

  late Map<int, Widget> indexTitles;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    indexTitles = <int, Widget>{
      0: Text(S.of(context).surah),
      1: Text(S.of(context).pages),
      2: Text(S.of(context).juzz),
    };
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigatorViewBloc>(
        create: (context) {
          return NavigatorViewBloc(
              ayahInfoService:
                  RepositoryProvider.of<AyahInfoRepository>(context));
        },
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          child: Column(children: <Widget>[
            Expanded(
                child: Padding(
              padding: EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0,
              ),
              child: Container(
                decoration: BoxDecoration(color: Colors.blue),
              ),
            )),
            SizedBox(
              width: double.infinity,
              child: CupertinoSlidingSegmentedControl(
                  children: indexTitles,
                  groupValue: _selectedIndex,
                  onValueChanged: (int? val) {
                    setState(() {
                      _selectedIndex = val;
                    });
                  }),
            )
          ]),
        ));
  }
}
