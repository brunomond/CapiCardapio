  import 'package:flutter/material.dart';

Widget AppBarWidget({title}){
    return AppBar(
    title: Text(title),
    titleSpacing: 0,
    automaticallyImplyLeading: true,
    leading: Builder(
    builder: (context) => IconButton(
        icon: Icon(Icons.menu),
        onPressed: () { Scaffold.of(context).openDrawer(); },
      ),
    ),
  );
}