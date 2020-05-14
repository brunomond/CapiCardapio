import 'package:CapiCardapio/Models/Enums.dart';
import 'package:flutter/foundation.dart';

class Product {
  String nome;
  String urlImage;
  double preco;
  String descricao;
  bool disponivel;
  Cardapio cardapio;
  Tipo tipo;

  Product(){
    this.disponivel = true;
  }

  Product.fromMap(Map map) {
    this.nome = map['nome'];
    this.urlImage = map['urlImage'];
    this.preco = map['preco'];
    this.descricao = map['descricao'];
    this.disponivel = map['disponivel'];

    switch (map['cardapio']) {
      case 'manha':
        this.cardapio = Cardapio.manha;
        break;
      case 'noite':
        this.cardapio = Cardapio.noite;
        break;
      case 'ambos':
        this.cardapio = Cardapio.ambos;
        break;
    }

    switch (map['tipo']) {
      case 'comida':
        this.tipo = Tipo.comida;
        break;
      case 'bebida':
        this.tipo = Tipo.bebida;
        break;
    }
  }

  //Product(this.nome, this.urlImage, this.preco, this.descricao, [this.disponivel=true]);

  Map toMap() {
    Map<String, dynamic> map = {
      'nome': nome,
      'urlImage': urlImage,
      'preco': preco,
      'descricao': descricao,
      'cardapio': describeEnum(cardapio),
      'tipo': describeEnum(tipo)
    };

    if (disponivel == null) map['disponivel'] = true;
    else map['disponivel'] = disponivel;

    return map;
  }

  bool ocultar() {
    this.disponivel = !this.disponivel;

    return this.disponivel;
  }

  @override
  String toString() {
    return 'Product{nome: $nome, urlImage: $urlImage, preco: $preco, descricao: $descricao, disponivel: $disponivel, cardapio: $cardapio, tipo: $tipo}';
  }
}
