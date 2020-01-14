import 'package:flutter/material.dart';


class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}


class _HomeWidgetState extends State<HomeWidget> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Books'),
      ),
      body: Container()
    );
  }

}
