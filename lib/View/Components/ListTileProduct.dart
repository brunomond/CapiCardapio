import 'package:flutter/material.dart';

class ListTileProduct extends StatelessWidget {
  final String title;
  final double price;
  final bool disponivel;
  final hideShow;
  final Function edit;
  final delete;

  ListTileProduct(
      {this.title,
      this.price,
      this.disponivel,
      this.hideShow,
      this.edit,
      this.delete});

  @override
  Widget build(BuildContext context) {
    Color iconColor = disponivel
        ? Theme.of(context).primaryColor
        : Theme.of(context).disabledColor;
    Color textColor =
        disponivel ? Colors.black : Theme.of(context).disabledColor;
    return GestureDetector(
      onTap: () => _showOptions(context),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            border:
                Border(bottom: BorderSide(width: 1, color: Colors.black54))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(fontSize: 18, color: textColor),
                  ),
                  Text(
                    'R\$ ${price.toStringAsFixed(2).replaceFirst('.', ',')}',
                    style: TextStyle(fontSize: 14, color: textColor),
                  ),
                ],
              ),
            ),
            GestureDetector(
                child: Icon(
                  Icons.edit,
                  color: iconColor,
                ),
                onTap: edit),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: GestureDetector(
                  child: disponivel
                      ? Icon(Icons.visibility, color: iconColor)
                      : Icon(Icons.visibility_off, color: iconColor),
                  onTap: hideShow),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8),
              child: GestureDetector(
                  child: Icon(Icons.delete_outline, color: iconColor),
                  onTap: delete),
            ),
          ],
        ),
      ),
    );
  }

  void _showOptions(
    BuildContext context,
  ) {
    showModalBottomSheet(
        context: context,
        builder: (context) => BottomSheet(
              onClosing: () => {},
              builder: (context) => Container(
                padding: EdgeInsets.only(bottom: 16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    FlatButton(
                      child: Text(
                        'Editar',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        edit();
                      },
                    ),
                    //Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).disabledColor))),),
                    FlatButton(
                      child: Text(
                        'Ocultar',
                        style: TextStyle(
                            fontSize: 20,
                            color: Theme.of(context).primaryColor),
                      ),
                      onPressed: () {
                        hideShow();
                        Navigator.pop(context);
                      },
                    ),
                    //Container(decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1, color: Theme.of(context).disabledColor))),),
                    FlatButton(
                      child: Text(
                        'Remover',
                        style: TextStyle(
                          fontSize: 20,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        delete();
                      },
                    ),
                  ],
                ),
              ),
            ));
  }
}
