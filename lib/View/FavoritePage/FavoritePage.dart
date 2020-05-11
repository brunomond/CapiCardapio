import 'package:CapiCardapio/View/Components/AppBarWidget.dart';
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
      drawer: DrawerPage(),
      body: GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24,
          crossAxisSpacing: 16,
          childAspectRatio: 0.7894736842105263,
        ),
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
             onTap: (){
              Navigator.pushNamed(context, '/descrition_page');
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  AspectRatio(
                    aspectRatio: 1.125,
                    child: Image.asset(
                      'images/Prato_Executivo.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Expanded(
                      child: Container(
                          color: Color.fromRGBO(173, 40, 49, 1),
                          padding: EdgeInsets.all(5),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Nome do Produto",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "R\$ ",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      "00.00                    ",
                                      //virgula ou ponto pra divisao decimal?
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w300),
                                    ),
                                    GestureDetector(
                                      child: Icon(
                                        Icons.favorite,
                                        color: Colors.white,
                                        size: 25,
                                      ),
                                    )
                                  ]),
                            ],
                          )))
                ],
              ),
            ),
          );
      })
    );
  }
}