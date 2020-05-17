import 'dart:io';

import 'package:CapiCardapio/Models/Enums.dart';
import 'package:CapiCardapio/Models/product.dart';
import 'package:CapiCardapio/View/Components/CheckboxForm.dart';
import 'package:CapiCardapio/View/Components/ImageSourceSheet.dart';
import 'package:CapiCardapio/View/Components/InvisibleText.dart';
import 'package:CapiCardapio/View/Components/RadioButtonForm.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';

class NewProductPage extends StatefulWidget {
  final Product product;

  NewProductPage({this.product});

  @override
  _NewProductPageState createState() => _NewProductPageState();
}

class _NewProductPageState extends State<NewProductPage> {
  final MoneyMaskedTextController _priceController =
      MoneyMaskedTextController(decimalSeparator: ',');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  Product _product;
  bool _cardapioRestaurante = false;
  bool _cardapioBar = false;
  bool _errorCheckbox = false;
  bool _errorRadio = false;
  bool _edited = false;
  bool _loadingImg = false;
  Tipo _tipo;

  @override
  void initState() {
    super.initState();

    if (widget.product == null) {
      _product = Product();
    } else {
      _product = Product.fromMap(widget.product.toMap());
      _titleController.text = _product.nome;
      _priceController.updateValue(_product.preco);
      _descriptionController.text = _product.descricao;

      switch (_product.cardapio) {
        case Cardapio.manha:
          setState(() {
            _cardapioRestaurante = true;
          });
          break;
        case Cardapio.noite:
          setState(() {
            _cardapioBar = true;
          });
          break;
        case Cardapio.ambos:
          setState(() {
            _cardapioRestaurante = true;
            _cardapioBar = true;
          });
          break;
      }

      setState(() {
        _tipo = _product.tipo;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _requestPop,
      child: Scaffold(
        appBar: AppBar(
          title: Text(_product.nome ?? 'Novo Prato'),
        ),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.save),
            onPressed: _saveProduct),
        body: Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) => ImageSourceSheet(
                                      onImageSelected: (image) {
                                        if (image == null)
                                          return;
                                        else
                                          setState(() {
                                            _edited = true;
                                          });
                                        _uploadImage(image);
                                      },
                                    ));
                          },
                          child: _loadingImg
                              ? Container(
                                  height:
                                      MediaQuery.of(context).size.height / 5,
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor),
                                    ),
                                  ),
                                )
                              : Container(
                                  height:
                                      MediaQuery.of(context).size.height / 3,
                                  width: MediaQuery.of(context).size.width,
                                  child: _product.urlImage != null
                                      ? FittedBox(
                                          fit: BoxFit.cover,
                                          child: Image.network(
                                            _product.urlImage,
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  width: 1,
                                                  color: Colors.black54)),
                                          child: Center(
                                              child: SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height /
                                                      5,
                                                  child: Image.asset(
                                                      'images/add_image.png')))),
                                ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                controller: _titleController,
                                decoration:
                                    InputDecoration(labelText: 'Título'),
                                validator: (value) =>
                                    value.isEmpty ? 'Digite um título!' : null,
                                onChanged: (text) {
                                  setState(() => _product.nome = text);
                                  _edited = true;
                                },
                              ),
                              TextFormField(
                                controller: _priceController,
                                decoration: InputDecoration(
                                    labelText: 'Preço', prefixText: 'R\$ '),
                                keyboardType: TextInputType.numberWithOptions(
                                    decimal: true),
                                validator: (value) =>
                                    _priceController.numberValue == 0
                                        ? 'Digite um preço!'
                                        : null,
                                onChanged: (text) {
                                  _product.preco = _priceController.numberValue;
                                  _edited = true;
                                },
                              ),
                              TextFormField(
                                controller: _descriptionController,
                                decoration: InputDecoration(
                                    labelText: 'Descrição',
                                    alignLabelWithHint: true,
                                    hintMaxLines: 120),
                                keyboardType: TextInputType.multiline,
                                maxLines: 3,
                                maxLength: 120,
                                validator: (value) => value.isEmpty
                                    ? 'Digite a descrição!'
                                    : null,
                                onChanged: (text) {
                                  _product.descricao = text;
                                  _edited = true;
                                },
                              ),
                              CheckboxForm(
                                title: 'Cardápio restaurante',
                                value: _cardapioRestaurante,
                                onChanged: (value) {
                                  setState(() {
                                    _edited = true;
                                    _cardapioRestaurante = value;
                                  });
                                },
                              ),
                              CheckboxForm(
                                title: 'Cardápio bar',
                                value: _cardapioBar,
                                onChanged: (value) {
                                  setState(() {
                                    _edited = true;
                                    _cardapioBar = value;
                                  });
                                },
                              ),
                              InvisibleText(
                                visible: _errorCheckbox,
                                text: 'Escolha pelo menos uma opção!',
                              ),
                              RadioButtonForm(
                                value: Tipo.comida,
                                groupValue: _tipo,
                                onChanged: (value) {
                                  setState(() {
                                    _edited = true;
                                    _tipo = value;
                                  });
                                },
                                title: 'Comida',
                              ),
                              RadioButtonForm(
                                value: Tipo.bebida,
                                groupValue: _tipo,
                                onChanged: (value) {
                                  setState(() {
                                    _edited = true;
                                    _tipo = value;
                                  });
                                },
                                title: 'Bebida',
                              ),
                              InvisibleText(
                                visible: _errorRadio,
                                text: 'Escolha uma opção!',
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  bool _validateText() {
    bool valid = _formKey.currentState.validate();
    if (_cardapioBar || _cardapioRestaurante) {
      setState(() {
        _errorCheckbox = false;
      });
    } else {
      setState(() {
        _errorCheckbox = true;
        valid = false;
      });
    }

    if (_tipo != null) {
      setState(() {
        _errorRadio = false;
      });
    } else {
      setState(() {
        _errorRadio = true;
        valid = false;
      });
    }
    return valid;
  }

  void _saveProduct() {
    if (_validateText()) {
      _product.tipo = _tipo;

      if (_cardapioRestaurante && _cardapioBar)
        _product.cardapio = Cardapio.ambos;
      else if (_cardapioRestaurante)
        _product.cardapio = Cardapio.manha;
      else
        _product.cardapio = Cardapio.noite;

      Navigator.of(context).pop(_product);
    }
  }

  Future<bool> _requestPop() {
    if (_edited) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text('Descartar Alterações?'),
                content: Text('Se sair as alterações serão perdidas!'),
                actions: <Widget>[
                  FlatButton(
                    child: Text(
                      'Cancelar',
                      style: TextStyle(color: Theme.of(context).primaryColor),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text(
                      'Sim',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                    onPressed: () {
                      Navigator.popUntil(
                          context, ModalRoute.withName('/admin_page'));
                    },
                  )
                ],
              ));
      return Future.value(false);
    }

    return Future.value(true);
  }

  void _uploadImage(File imgFile) async {
    StorageUploadTask task = FirebaseStorage.instance
        .ref()
        .child(DateTime.now().millisecondsSinceEpoch.toString())
        .putFile(imgFile);

    setState(() {
      _loadingImg = true;
    });

    StorageTaskSnapshot taskSnapshot = await task.onComplete;
    String imgUrl = await taskSnapshot.ref.getDownloadURL();

    setState(() {
      _product.urlImage = imgUrl;
      _loadingImg = false;
    });
  }
}
