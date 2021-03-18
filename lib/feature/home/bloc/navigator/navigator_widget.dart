import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran_reader/generated/l10n.dart';

class NavigatorWidget extends StatefulWidget {
  @override
  _NavigatorWidgetState createState() => _NavigatorWidgetState();
}

class _NavigatorWidgetState extends State<NavigatorWidget> {
  int? _selectedIndex = 0;

  late Map<int, Widget> indexTitles;

  @override
  void initState() {
    super.initState();
    indexTitles = <int, Widget>{
      0: Text(S.of(context).surah),
      1: Text(S.of(context).pages),
      2: Text(S.of(context).juzz),
    };
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      const Expanded(
          child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 32.0,
          horizontal: 16.0,
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
    ]);
  }
}
