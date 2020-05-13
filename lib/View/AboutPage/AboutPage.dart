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
  void _menu() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title: "Sobre"),
        drawer: DrawerPage(),
        body: ListView(children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Image.asset(
                    "images/About.jpeg",
                    fit: BoxFit.cover,
                    alignment: Alignment.center,
                    width:  MediaQuery.of(context).size.width,
                    height: 150,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding:EdgeInsets.only(left:16),
                    color: Theme.of(context).primaryColor,
                    child: Row(children: <Widget>[
                      Container(
                        height: 50.0,
                        width: 50.0,
                        child: CircleAvatar(
                            radius: 32,
                            backgroundImage: AssetImage('images/avatar.png'),
                            backgroundColor: Colors.white
                        ),
                      ),
                      Stack(
                          alignment: Alignment.topCenter,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top:24,left:16,right:8,bottom:24),
                              child: Text(
                                "Twins Bar & Restaurante",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ]),
                    ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 24, top: 16, right: 24,bottom: 24),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Text(
                              "Descrição",
                              style: TextStyle(
                                  color: Color.fromRGBO(33, 33, 33, 1),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                            "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
                            style: TextStyle(
                                color: Color.fromRGBO(66, 66, 66, 1), fontSize: 16),
                          ),
                        ]),
                  ),
                  Container(
                    margin:EdgeInsets.only(left: 16,right:16,bottom:16),
                    width: MediaQuery.of(context).size.width,
                    padding:EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Horário de funcionamento",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.watch_later,
                                    color: Colors.white, size: 32),
                              ),
                              Text(
                                  "Aberto das 10:00 às 00:00 de \nTerça aos Domingos",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Telefone e endereço",
                              style: TextStyle(color: Colors.white, fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(Icons.local_phone,
                                    color: Colors.white, size:32),
                              ),
                              Text(
                                  "67 99000-0000 - 67 99000-0000\n67 3333-0000",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16))
                            ],
                          ),
                          Row(
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(Icons.location_on, color: Colors.white, size:32),
                                ),
                                Text(
                                  "Av. Afonso Pena, N° 1020\nJardim dos Estados",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16))

                              ],
                          )
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:8.0),
                    child: Image.asset(
                      "images/rodape_about.jpeg",
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: 48,
                    ),
                  ),
                ]),
              ]
        ));
  }
}
