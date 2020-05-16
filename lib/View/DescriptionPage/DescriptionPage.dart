import 'package:CapiCardapio/Models/product.dart';
import 'package:flutter/material.dart';
class DescriptionPage extends StatefulWidget {

  final Product product;

  DescriptionPage({this.product});

  @override
  _DescritionPageState createState() => _DescritionPageState();
}

class _DescritionPageState extends State<DescriptionPage> {

  bool _favorito = true;
  String _valor = 'preco';
  String _nome = 'nome';
  String _image = 'image';
  String _descri= 'descricao';

  @override
  void initState() {
    super.initState();
    _valor = widget.product.preco.toStringAsFixed(2).replaceAll('.', ',');
    _nome = widget.product.nome;
    _image = widget.product.urlImage;
    _descri= widget.product.descricao;

  }


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
        title: Text(_nome),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 3,
          child: Image.network(_image, fit: BoxFit.cover,),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.12,
          color: Theme.of(context).primaryColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
            Expanded(
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4),
                        child: Text(
                          _nome,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Text(
                        "R\$ $_valor",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w400),
                      ),
                      ],),
                  ),
                  Positioned(
                    height: 64,
                    width: 64,
                    top: -32,
                    left: MediaQuery.of(context).size.width - 72,
                    child: FloatingActionButton(
                      elevation: 4,
                      backgroundColor: Theme.of(context).primaryColorDark,
                      onPressed: _fav,
                      child:
                      Icon(_favorito ? Icons.favorite : Icons.favorite_border,size:32),
                    ),
                  )
                ]
              ),
            )
          ],
        ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
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
                        fontWeight: FontWeight.w700),
                ),
                  ),
                Text(
                  _descri,
                  style: TextStyle(color: Color.fromRGBO(66, 66, 66, 1), fontSize: 18),
                  textAlign: TextAlign.justify,
                ),
                ]
            ),
          ),
        )
      ])
    );
  }

}
