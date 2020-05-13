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
        body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Image.asset(
                "images/About.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 265,
              ),
              Container(
                width: double.infinity,
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
                      overflow: Overflow.visible,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(24),
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
                padding: const EdgeInsets.only(left: 24, top: 16, right: 24),
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
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Text(
                        "Lorem Ipsum é simplesmente uma simulação de texto da indústria tipográfica quando um impressor desconhecido pegou uma bandeja de tipos e os embaralhou para fazer um livro de modelos de tipos.",
                        style: TextStyle(
                            color: Color.fromRGBO(66, 66, 66, 1), fontSize: 18),
                      ),
                    ]),
              ),
              Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Theme.of(context).primaryColor,
                    width: 379.0,
                    height: 180.0,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "Horário de funcionamento",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.watch_later,
                                  color: Colors.white, size: 31),
                              Text(
                                  "Aberto das 10:00 às 00:00 de Terça aos \nDomingos",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19))
                            ],
                          ),
                          Text(
                            "Telefone e endereço",
                            style: TextStyle(color: Colors.white, fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: <Widget>[
                              Icon(Icons.local_phone,
                                  color: Colors.white, size: 31),
                              Text(
                                  "67 99000-0000 - 67 99000-0000\n67 3333-0000",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 19))
                            ],
                          ),
                          Row(
                              children: <Widget>[
                                Icon(Icons.location_on, color: Colors.white, size:31),
                                Text(
                                  "Av. Afonso Pena, N° 1020\nJardim dos Estados",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 19))

                              ],
                          )
                        ]),
                  )),
              Image.asset(
                "images/rodape_about.jpeg",
                fit: BoxFit.cover,
                width: double.infinity,
                height: 50,
              ),
            ]));
  }
}
