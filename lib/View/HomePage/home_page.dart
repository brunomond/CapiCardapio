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

    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(selectedPage: 'home',),
      body: Container(
        padding: EdgeInsets.only(top: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: CardWidget(
                context,
                title:"Restaurante",
                subTitle: "Pratos selecionados para sua refeição.",
                hours: "10:00 às 14:00",
                image: AssetImage('images/restaurant.jpg'),
                navigatorToPage: (){
                  Navigator.pushNamed(context, '/menu_rest');
                },
              ),
            ),
            Expanded(
              flex: 5,
              child: CardWidget(
                  context,
                  title:"Bar e Happy Hour",
                  subTitle: "Porções e bebidas para sua noite.",
                  hours: "18:00 às 00:00",
                  image: AssetImage('images/bar.jpg'),
                  navigatorToPage: (){
                    Navigator.pushNamed(context, '/menu_bar');
                  }
              ),
            ),
            Expanded(flex: 2, child: EnderecoWidget(context))
          ],
        ),
      ),// This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
