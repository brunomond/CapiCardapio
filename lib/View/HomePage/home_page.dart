import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/Components/CardWidget.dart';
import 'package:CapiCardapio/View/Components/EnderecoWidget.dart';
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


    var wrapper = Center(
        child: ListView(
          children: <Widget>[
            CardWidget(
              context,
              title:"Restaurante",
              subTitle: "Pratos selecionados para sua refeição.",
              hours: "10:00 às 14:00",
              image: AssetImage('images/restarant.jpg'),
              navigatorToPage: (){
                Navigator.pushNamed(context, '/descrition_page');
              },
            ),
            CardWidget(
              context,
              title:"Bar e Happy Hour",
              subTitle: "Porções e bebidas para sua noite.",
              hours: "18:00 às 00:00",
              image: AssetImage('images/bar.jpg'),
              navigatorToPage: (){
                Navigator.pushNamed(context, '/favorite_page');
              }
            ),
            EnderecoWidget(context)
          ],
        ),
    );

    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(),
      body: wrapper,// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
