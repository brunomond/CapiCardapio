import 'package:flutter/material.dart';
import 'View/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twins Bar & Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromRGBO(173, 40, 49, 1),

      ),
      home: HomePage(title: 'Twins Bar & Restaurante'),
    );
  }
}

