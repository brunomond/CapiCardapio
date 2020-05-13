import 'package:flutter/material.dart';

// SplashScreen
import 'package:CapiCardapio/View/splash_page.dart';

// Pages
import 'package:CapiCardapio/View/AboutPage/AboutPage.dart';
import 'package:CapiCardapio/View/AdminPage/AdminPage.dart';
import 'package:CapiCardapio/View/FavoritePage/FavoritePage.dart';
import 'package:CapiCardapio/View/HomePage/home_page.dart';
import 'package:CapiCardapio/View/AdminPage/LoginAdminPage.dart';
import 'package:CapiCardapio/View/DescriptionPage/DescriptionPage.dart';
import 'package:CapiCardapio/View/MenuPageRest/MenuPageRest.dart';
import 'package:CapiCardapio/View/MenuPageBar/MenuPageBar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Twins Bar & Restaurante',
      theme: ThemeData(
        primaryColor: Color.fromRGBO(153,32,40, 1),
        primaryColorDark: Color.fromRGBO(100, 13, 20, 1),
        disabledColor: Color.fromRGBO(130, 130, 130, 1),
      ),
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/home_page': (BuildContext context) => HomePage(title: 'Twins Bar & Restaurante'),
        '/favorite_page': (BuildContext context) => FavoritePage(title: 'Favoritos'),
        '/about_page': (BuildContext context) => AboutPage(title: 'Twins Bar & Restaurante'),
        '/admin_page': (BuildContext context) => AdminPage(title: 'Admin'),
        '/description_page': (BuildContext context) => DescriptionPage(title: 'Descrição'),
        '/login_admin': (BuildContext context) => LoginAdminPage(title: 'Admin'),
        '/menu_rest':(BuildContext context) => CardapioRest(),
        '/menu_bar' :(BuildContext context) => CardapioBar(),
      },
    );
  }
}
