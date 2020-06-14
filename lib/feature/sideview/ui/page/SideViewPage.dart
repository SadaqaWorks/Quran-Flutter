import 'package:flutter/material.dart';
import 'package:quran_reader/generated/i18n.dart';

class SideViewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return DefaultTabController(
      length: 3,
      child: new Scaffold(
        body: TabBarView(
          children: [
            new Container(
              color: Colors.yellow,
            ),
            new Container(
              color: Colors.orange,
            ),
            new Container(
              color: Colors.lightGreen,
            )
          ],
        ),
        bottomNavigationBar: new TabBar(
          tabs: [
            Tab(
              text: S.of(context).pages,
            ),
            Tab(
              text: S.of(context).surah,
            ),
            Tab(
              text: S.of(context).juzz,
            )
          ],
          labelColor: Colors.yellow,
          unselectedLabelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorPadding: EdgeInsets.all(5.0),
          indicatorColor: Colors.red,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}
