import 'package:CapiCardapio/View/Components/MenuItem.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class ComidasRest extends StatefulWidget {
  @override
  _ComidasRestState createState() => _ComidasRestState();
}

class _ComidasRestState extends State<ComidasRest> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('products')
            .where('cardapio', arrayContains: 'manha')
            .where('tipo', isEqualTo: 'comida')
            .snapshots(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
              break;
            default:
              List<DocumentSnapshot> documents =
              snapshot.data.documents.toList();

              print(documents);

              return GridView.builder(
                  padding: EdgeInsets.all(10.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 0.7894736842105263,
                  ),
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    return MenuItem(
                      imageUrl: documents[index].data['urlImage'],
                      title: documents[index].data['nome'],
                      price: documents[index].data['preco'],
                      favorite: false,
                      onTap: _navigateToDescription,
                    );
                  });
              break;
          }
        });
  }
  void _navigateToDescription(){
    Navigator.pushNamed(context, '/description_page');
  }
}
