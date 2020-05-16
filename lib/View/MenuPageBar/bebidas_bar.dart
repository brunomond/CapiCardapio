import 'package:CapiCardapio/Models/product.dart';
import 'package:CapiCardapio/View/Components/MenuItem.dart';
import 'package:CapiCardapio/View/DescriptionPage/DescriptionPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class BebidasBar extends StatefulWidget {
  @override
  _BebidasBarState createState() => _BebidasBarState();
}

class _BebidasBarState extends State<BebidasBar> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance
            .collection('products')
            .where('cardapio', arrayContains: 'noite')
            .where('tipo', isEqualTo: 'bebida')
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
                      onTap: () => _navigateToDescription(Product.fromMap(documents[index].data)),
                    );
                  });
              break;
          }
        });
  }

  void _navigateToDescription(Product product) {
    Navigator.push(context, MaterialPageRoute(builder: (context) => DescriptionPage(product: product)));
  }
}
