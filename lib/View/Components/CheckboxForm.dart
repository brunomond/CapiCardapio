import 'package:flutter/material.dart';

class CheckboxForm extends StatelessWidget {
  final String title;
  final bool value;
  final ValueChanged<dynamic> onChanged;
  CheckboxForm({@required this.title,@required this.value,@required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Checkbox(
          activeColor: Theme.of(context).primaryColor,
          checkColor: Colors.white,
          value: value,
          onChanged: onChanged,
          materialTapTargetSize:
          MaterialTapTargetSize.shrinkWrap,
        ),
        Padding(
          padding: EdgeInsets.only(left: 8),
          child: Text(
            title,
            style: TextStyle(fontSize: 18),
          ),
        )
      ],
    );
  }
}
