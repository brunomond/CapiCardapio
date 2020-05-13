import 'package:CapiCardapio/View/Components/MenuItem.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ComidasRest extends StatefulWidget {
  @override
  _ComidasRestState createState() => _ComidasRestState();
}

class _ComidasRestState extends State<ComidasRest> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
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
          
        });
  }
  void _navigateToDescription(){
    Navigator.pushNamed(context, '/description_page');
  }
}
