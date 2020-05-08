import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:flutter/material.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    var center = Center(
        child: ListView(
          children: <Widget>[
            Text("Home")
          ],
        ),
    );

    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(),
      body: center,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
