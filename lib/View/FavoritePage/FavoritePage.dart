import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/Components/MenuItem.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:flutter/material.dart';

class FavoritePage extends StatefulWidget {

  final String title;
  const FavoritePage({Key key, this.title}) : super(key: key);

  @override
  _FavoritePageState createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(title: widget.title),
      drawer: DrawerPage(selectedPage: 'favorites',),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7894736842105263,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return MenuItem(title: 'Porção batata frita com bacon e cheddar', price: 12.4, favorite: false, onTap: _navigateToDescription,);
      })
    );
  }

  void _navigateToDescription(){
    Navigator.pushNamed(context, '/description_page');
  }
}