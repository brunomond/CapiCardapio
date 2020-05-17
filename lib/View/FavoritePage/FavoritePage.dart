import 'package:CapiCardapio/Models/product.dart';
import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/Components/MenuItem.dart';
import 'package:CapiCardapio/View/DescriptionPage/DescriptionPage.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        drawer: DrawerPage(
          selectedPage: 'favorites',
        ),
        body: FutureBuilder(
            future: Product.getFavorites(),
            builder: (context, AsyncSnapshot<List<String>> snapshotFavs) {
              switch (snapshotFavs.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                  break;
                default:
                  if (snapshotFavs.data.isNotEmpty) {
                    return StreamBuilder(
                        stream: Firestore.instance
                            .collection('products')
                            .where('nome', whereIn: snapshotFavs.data.toList())
                            .snapshots(),
                        builder: (context, snapshot) {
                          switch (snapshot.connectionState) {
                            case ConnectionState.none:
                            case ConnectionState.waiting:
                              return Center(
                                  child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Theme.of(context).primaryColor)));
                              break;
                            default:
                              List<DocumentSnapshot> documents =
                                  snapshot.data.documents.toList();

                              return GridView.builder(
                                  padding: EdgeInsets.all(10.0),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 10,
                                    childAspectRatio: 0.7894736842105263,
                                  ),
                                  itemCount: documents.length,
                                  itemBuilder: (context, index) {
                                    return MenuItem(
                                      imageUrl:
                                          documents[index].data['urlImage'],
                                      title: documents[index].data['nome'],
                                      price: documents[index].data['preco'],
                                      favorite: _isfavorite(Product.fromMap(
                                              documents[index].data)) ??
                                          Future.value(false),
                                      onFavorite: () => _favorite(
                                          Product.fromMap(
                                              documents[index].data)),
                                      onTap: () => _navigateToDescription(
                                          Product.fromMap(
                                              documents[index].data)),
                                    );
                                  });
                              break;
                          }
                        });
                  } else {
                    return Container(
                      child: Center(
                        child: Text(
                          'Você ainda não possui favoritos!',
                          style:
                              TextStyle(color: Theme.of(context).disabledColor, fontSize: 25),
                          maxLines: 2,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }
              }
            }));
  }

  void _navigateToDescription(Product product) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => DescriptionPage(product: product)));
  }

  void _favorite(Product product) {
    product.addFavorites();
    setState(() {});
  }

  Future<bool> _isfavorite(Product product) {
    return product.isFavorite();
  }
}
