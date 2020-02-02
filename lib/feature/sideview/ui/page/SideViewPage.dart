import 'package:flutter/material.dart';

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
              new Container(color: Colors.orange,),
              new Container(
                color: Colors.lightGreen,
              )
            ],
          ),
          bottomNavigationBar: new TabBar(
            tabs: [
              Tab(
                icon: new Icon(Icons.home),
              ),
              Tab(
                icon: new Icon(Icons.rss_feed),
              ),
              Tab(
                icon: new Icon(Icons.perm_identity),
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