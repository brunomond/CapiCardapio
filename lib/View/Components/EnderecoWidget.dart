import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

Widget EnderecoWidget(context, {Function onTapPhone, Function onTapAddress}) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.13,
    width: MediaQuery.of(context).size.width,
    margin: EdgeInsets.all(10),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.all(Radius.circular(2)),
      shape: BoxShape.rectangle,
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8),
                child: Icon(Icons.phone, color: Colors.white, size: 24),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  GestureDetector(
                      onTap: () => onTapPhone(1),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('(67) 99000-0000',
                            style: TextStyle(color: Colors.white)),
                      )),
                  GestureDetector(
                      onTap: () => onTapPhone(2),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('(67) 99000-0000',
                            style: TextStyle(color: Colors.white)),
                      )),
                  GestureDetector(
                      onTap: () => onTapPhone(3),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text('(67) 3397-0000',
                            style: TextStyle(color: Colors.white)),
                      )),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: GestureDetector(
            onTap: () => onTapAddress('Av. Afonso Pena, Nº 1020, Jardim dos Estados'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Icon(Icons.map, color: Colors.white, size: 24),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(top: 8, right: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        AutoSizeText(
                          'Av. Afonso Pena, Nº 1020, Jardim dos Estados',
                          style: TextStyle(color: Colors.white),
                          maxLines: 4,
                          softWrap: true,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
