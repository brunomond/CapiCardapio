import 'package:flutter/material.dart';
class DescritionPage extends StatefulWidget {
  DescritionPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _DescritionPageState createState() => _DescritionPageState();
}

class _DescritionPageState extends State<DescritionPage> {

  bool _favorito = true;
  String _valor = "17,00";
  String _nome = "Prato executivo de carne";
  String _image = "images/Prato_Executivo.jpg";
  String _descri= "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.";

  void _fav() {
    print("Flowers");
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
        title: Text("Cardápio Restaurante"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Image.asset(
          _image,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 265,
        ),
        Container(
          width: double.infinity,
          color: Theme.of(context).primaryColor,
          child: Row(
            children: <Widget>[
            Stack(
              alignment: Alignment.topCenter,
              overflow: Overflow.visible,
              children: [
                Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text(
                      _nome,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "RS $_valor",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                    ),
                    ],),
                ),
                Positioned(
                  height: 64,
                  width: 64,
                  top:-32,
                  right:-64,
                  child: FloatingActionButton(
                    elevation: 4,
                    backgroundColor: Theme.of(context).primaryColorDark,
                    onPressed: _fav,
                    child:
                    Icon(_favorito ? Icons.favorite : Icons.favorite_border,size:32),
                  ),
                )
              ]
            )
          ],
        ),
        ),
        Padding(
          padding: const EdgeInsets.only(left:24,top:16,right:24),
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
                _descri,
                style: TextStyle(color: Color.fromRGBO(66, 66, 66, 1), fontSize: 16),
              ),
              ]
          ),
        )
      ])
    );
  }
}
