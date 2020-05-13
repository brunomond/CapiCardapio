import 'package:flutter/material.dart';

class InvisibleText extends StatelessWidget {

  final bool visible;
  final String text;

  InvisibleText({@required this.visible, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: visible ? 1 : 0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 10),
              child: Text(
                text,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ));
  }
}
