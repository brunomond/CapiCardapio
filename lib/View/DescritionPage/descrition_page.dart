import 'package:flutter/material.dart';
class DescritionPage extends StatefulWidget {
  DescritionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DescritionPageState createState() => _DescritionPageState();
}

class _DescritionPageState extends State<DescritionPage> {
  void _retornar() {
    Navigator.popAndPushNamed(context, '/home_page');
  }
  bool _favorito = true;
  String _valor = "17,00";
  String _nome = "Prato executivo de carne";
  String _image = "images/Prato_Executivo.jpg";
  String _descri= "exemplo";

  void _fav() {
    setState(() {
      if (_favorito == true) {
        _favorito = false;
      } else {
        _favorito = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: _retornar,
        ),
        title: Text("Cardápio Restaurante"),
      ),
      body: Column(children: <Widget>[
        Image.asset(
          _image,
          fit: BoxFit.cover,
          height: 262.0,
        ),
        Container(
          height: 67.0,
          width: 1000.0,
          color: Color.fromRGBO(173, 40, 49, 1),
          child: Row(
            children: <Widget>[
              Expanded(
                child: Column(children: <Widget>[
                  Text(
                    _nome,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold),
                  ),
                  Align(
                    alignment: Alignment(-0.75, 0.7),
                    child: Text(
                      "RS $_valor",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ]),
              ),
              Align(
                alignment: Alignment(0.0, -1.0),
                child: FloatingActionButton(
                  backgroundColor: Color.fromRGBO(173, 1, 2, 1),
                  onPressed: _fav,
                  child:
                  Icon(_favorito ? Icons.favorite : Icons.favorite_border),
                ),
              )
            ],
          ),
        ),
        Align(
            alignment: Alignment(-0.7, 0.0),
            child: Text(
              "Descrição",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold),
            )),
        Align(
            alignment: Alignment(-0.7, 0.0),
            child: Text(
              _descri,
              style: TextStyle(color: Colors.black, fontSize: 25.0),
            )),
      ]),
    );
  }
}
