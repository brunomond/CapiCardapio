import 'package:CapiCardapio/View/home_page.dart';
import 'package:CapiCardapio/View/splash_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twins Bar & Restaurante',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color.fromRGBO(173, 40, 49, 1),
      ),
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home_page': (BuildContext context) =>
            new HomePage(title: 'Twins Bar & Restaurante')
      },
    );
  }
}
