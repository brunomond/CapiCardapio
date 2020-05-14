import 'package:CapiCardapio/View/Components/AboutWidget.dart';
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
      appBar: AppBarWidget(title: "Sobre"),
      drawer: DrawerPage(
        selectedPage: 'about',
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Image.asset(
              "images/About.jpeg",
              fit: BoxFit.fill,
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 190,
            ),
            Container(
                width: MediaQuery.of(context).size.width,
                height: 70,
                padding: EdgeInsets.only(left: 16),
                color: Theme.of(context).primaryColor,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                          height: 50.0,
                          width: 50.0,
                          child: Image.asset('images/twins_logo_white.png')),
                      Text(
                        "Twins Bar & Restaurante",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.w600),
                      ),
                    ])),
            Padding(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 8),
                    child: Text(
                      "Descrição",
                      style: TextStyle(
                          color: Color.fromRGBO(33, 33, 33, 1),
                          fontSize: 18,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Text(
                    "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
                    style: TextStyle(
                        color: Color.fromRGBO(66, 66, 66, 1), fontSize: 16),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: AboutWidget(),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    child: Container(
                      margin: EdgeInsets.only(right: 32),
                      width: 40,
                      height: 40,
                      child: Image.asset(
                        'images/facebook_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: Container(
                        width: 40,
                        height: 40,
                        child: Image.asset(
                          'images/instagram_logo.png',
                          fit: BoxFit.cover,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
