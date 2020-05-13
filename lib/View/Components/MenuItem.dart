import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final Function onTap;
  final String imageUrl;
  final String title;
  final double price;
  final bool favorite;
  final Function onFavorite;

  MenuItem({this.onTap, this.imageUrl, this.title, this.price, this.favorite, this.onFavorite});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: AspectRatio(
          aspectRatio: 1.125,
          child: Card(
              elevation: 8,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                     Expanded(
                       flex: 23,
                       child: imageUrl != null
                            ? Image.network(
                                imageUrl,
                                fit: BoxFit.cover,
                              )
                            : Image.asset('images/twins_logo_red.png'),
                     ),

                    Expanded(
                      flex: 10,
                      child: Container(
                        color: Theme.of(context).primaryColor,
                        padding: EdgeInsets.all(5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: AutoSizeText(
                                title,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: <Widget>[
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: <Widget>[
                                          Text(
                                            "R\$ ",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            price
                                                .toStringAsFixed(2)
                                                .replaceAll('.', ','),
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w300),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Align(
                                        alignment: Alignment.centerRight,
                                        child: GestureDetector(
                                          onTap: onFavorite,
                                          child: Icon(
                                            favorite ? Icons.favorite : Icons.favorite_border,
                                            color: Colors.white,
                                            size: 25,
                                          ),
                                        ),
                                      ),
                                    )
                                  ]),
                            ),

                          ],
                        ),
                      ),
                    )
                  ])),
        ));
  }
}
