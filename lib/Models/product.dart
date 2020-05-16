import 'dart:async';
import 'dart:core';

import 'package:CapiCardapio/Models/Enums.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Product {
  String nome;
  String urlImage;
  double preco;
  String descricao;
  bool disponivel;
  Cardapio cardapio;
  Tipo tipo;
  bool favorite;

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

  void addFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favs = List<String>();
    bool isFavorite = await this.isFavorite();

    if (prefs.getStringList('favorites') != null)
      favs = prefs.getStringList('favorites');

    if (isFavorite)
      favs.remove(this.nome);
    else
      favs.add(this.nome);

    prefs.setStringList('favorites', favs);
  }

  static Future<List<String>> getFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList('favorites');
  }

  Future<bool> isFavorite() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isFavorite = false;
    List<String> favs = prefs.getStringList('favorites');

    if (favs != null) {
      favs.forEach((element) {
        if (element == this.nome) isFavorite = true;
      });
    }

    return isFavorite;
  }
}
