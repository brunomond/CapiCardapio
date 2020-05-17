import 'package:CapiCardapio/Models/product.dart';
import 'package:CapiCardapio/View/AdminPage/NewPasswordPage.dart';
import 'package:CapiCardapio/View/AdminPage/NewProductPage.dart';
import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
import 'package:CapiCardapio/View/Components/ListTileProduct.dart';
import 'package:CapiCardapio/View/DrawerPage/DrawerPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AdminPage extends StatefulWidget {
  final String title;

  const AdminPage({Key key, this.title}) : super(key: key);

  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool _logged = false;

  @override
  void initState() {
    super.initState();
    testLogin();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        appBar: AppBarWidget(title: widget.title, actions: <Widget>[
          PopupMenuButton<String>(
            offset: Offset(0, 50),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              PopupMenuItem<String>(
                value: 'alterar_senha',
                child: Text('Alterar Senha'),
              ),
              PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              )
            ],
            onSelected: (String result) {
              switch (result) {
                case 'alterar_senha':
                  _updatePassword();
                  break;
                case 'logout':
                  _logout();
                  break;
              }
            },
          )
        ]),
        drawer: DrawerPage(selectedPage: 'admin',),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Theme.of(context).primaryColor,
          child: Icon(Icons.add),
          onPressed: _newProduct,
        ),
        body: _logged
            ? StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance
                    .collection('products')
                    .orderBy('disponivel', descending: true)
                    .snapshots(),
                builder: (context, snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor),
                        ),
                      );
                    default:
                      List<DocumentSnapshot> documents =
                          snapshot.data.documents.toList();

                      return ListView.builder(
                          padding: EdgeInsets.all(10),
                          itemCount: documents.length,
                          itemBuilder: (context, index) {
                            return ListTileProduct(
                              title: documents[index].data['nome'],
                              price: documents[index].data['preco'],
                              disponivel: documents[index].data['disponivel'],
                              edit: () => _newProduct(
                                  product:
                                      Product.fromMap(documents[index].data),
                                  docRef: documents[index].documentID),
                              hideShow: () => _hideShow(
                                  Product.fromMap(documents[index].data),
                                  documents[index].documentID),
                              delete: () => _deleteProduct(
                                  Product.fromMap(documents[index].data),
                                  documents[index].documentID),
                            );
                          });
                  }
                },
              )
            : Center(
                child: CircularProgressIndicator(),
              ));
  }

  void testLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var status = prefs.getBool('logged') ?? false;

    if (status) {
      setState(() {
        _logged = status;
      });
    } else {
      Navigator.pushReplacementNamed(context, '/login_admin');
    }
  }

  void _logout() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('logged', false);

    setState(() {
      _logged = prefs.getBool('logged');
    });

    Navigator.popAndPushNamed(context, '/login_admin');
  }

  void _updatePassword() async {
    bool result = await Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => NewPasswordPage())) ??
        false;
    if (result) {
      _scaffoldKey.currentState.removeCurrentSnackBar();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text('Senha alterada com sucesso!'),
        backgroundColor: Theme.of(context).primaryColor,
        duration: Duration(milliseconds: 1500),
      ));
    }
  }

  void _newProduct({Product product, String docRef}) async {
    final productReceiver = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => NewProductPage(product: product)));

    if (productReceiver != null) {
      if (product != null) {
        Firestore.instance
            .collection('products')
            .document(docRef)
            .updateData(productReceiver.toMap());
      } else {
        Firestore.instance
            .collection('products')
            .document()
            .setData(productReceiver.toMap());
      }
    }
  }

  void _hideShow(Product product, String docRef) {
    product.ocultar();

    Firestore.instance
        .collection('products')
        .document(docRef)
        .updateData(product.toMap());
  }

  void _deleteProduct(Product product, String docRef) {
    showDialog(
        context: context,
        builder: (context) => Center(
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.85,
            child: Expanded(
              child: AlertDialog(
                    title: Text("Remover ${product.nome}"),
                    content: Text("Deseja realmente remover o item?"),
                    actions: <Widget>[
                      FlatButton(
                        child: Text(
                          "Não",
                          style: TextStyle(color: Theme.of(context).primaryColor),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FlatButton(
                        child: Text(
                          "Sim",
                          style: TextStyle(color: Theme.of(context).disabledColor),
                        ),
                        onPressed: () {
                          Firestore.instance
                              .collection('products')
                              .document(docRef)
                              .delete()
                              .catchError((e) => print(e));
                          Navigator.pop(context);
                        },
                      )
                    ],
                  ),
            ),
          ),
        ));
  }
}
