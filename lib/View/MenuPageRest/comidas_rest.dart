import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Comidas extends StatefulWidget {
  @override
  _ComidasState createState() => _ComidasState();
}

class _ComidasState extends State<Comidas> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.all(16),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 24.0,
          crossAxisSpacing: 16.0,
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
        });
  }
}
