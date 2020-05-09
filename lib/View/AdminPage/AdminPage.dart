import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:flutter/material.dart';

class AdminPage extends StatefulWidget {

  final String title;
  const AdminPage({Key key, this.title}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(),
      body: ListView(
        children: <Widget>[

        ],
      )
    );
  }
}