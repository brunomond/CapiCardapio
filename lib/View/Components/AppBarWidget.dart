  import 'package:flutter/material.dart';

Widget AppBarWidget({String title, List<Widget> actions}){
    return AppBar(
    title: Text(title),
    titleSpacing: 0,
    automaticallyImplyLeading: true,
    actions: actions,
    leading: Builder(
    builder: (context) => IconButton(
        icon: Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer();},
      ),
    ),
  );
}