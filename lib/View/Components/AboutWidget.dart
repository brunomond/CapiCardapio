import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutWidget extends StatelessWidget {

  final Function onTapPhone;
  final Function onTapAddress;
  final GlobalKey _textKey = GlobalKey();
  AboutWidget({this.onTapPhone, this.onTapAddress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(2),
      ),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Horário de funcionamento",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.access_time, color: Colors.white, size: 32),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text("10:00 às 14:00 e 18:00 às 00:00 de Terça a Domingo",
                        style: TextStyle(color: Colors.white, fontSize: 16), maxLines: 4),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Telefones e endereço",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
              onTap: () => onTapPhone('(67) 99000-0000 - (67) 99000-0000 - (67) 3333-0000'),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.local_phone, color: Colors.white, size: 32),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('(67)99000-0000 - (67)99000-0000 - (67)3333-0000',
                          style: TextStyle(color: Colors.white, fontSize: 16), maxLines: 3,),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () => onTapAddress('Av. Afonso Pena, N° 1020 Jardim dos Estados'),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.location_on, color: Colors.white, size: 32),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: AutoSizeText('Av. Afonso Pena, N° 1020 Jardim dos Estados',
                          style: TextStyle(color: Colors.white, fontSize: 16), maxLines: 3,),
                    ),
                  )
                ],
              ),
            )
          ]),
    );
  }
}
