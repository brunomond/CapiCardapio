import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {

  final String title;
  const AboutPage({Key key, this.title}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(),
      body: ListView(
        children: <Widget>[
            Text("About")
        ],
      )
    );
  }
}