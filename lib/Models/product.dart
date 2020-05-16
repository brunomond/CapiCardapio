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

  Product() {
    this.disponivel = true;
  }

  Product.fromMap(Map map) {
    this.nome = map['nome'];
    this.urlImage = map['urlImage'];
    this.preco = map['preco'];
    this.descricao = map['descricao'];
    this.disponivel = map['disponivel'];

    if (map['cardapio'].length > 1)
      this.cardapio = Cardapio.ambos;
    else {
      if (map['cardapio'][0] == 'manha')
        this.cardapio = Cardapio.manha;
      else
        this.cardapio = Cardapio.noite;
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

  Map toMap() {
    Map<String, dynamic> map = {
      'nome': nome,
      'urlImage': urlImage,
      'preco': preco,
      'descricao': descricao,
      'tipo': describeEnum(tipo)
    };

    switch (cardapio) {
      case Cardapio.manha:
        map['cardapio'] = ['manha'];
        break;
      case Cardapio.noite:
        map['cardapio'] = ['noite'];
        break;
      case Cardapio.ambos:
        map['cardapio'] = ['manha', 'noite'];
        break;
    }
    if (disponivel == null)
      map['disponivel'] = true;
    else
      map['disponivel'] = disponivel;

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
