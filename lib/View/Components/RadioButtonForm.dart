import 'package:flutter/material.dart';

class RadioButtonForm extends StatelessWidget {
  final groupValue;
  final value;
  final ValueChanged<dynamic> onChanged;
  final String title;

  RadioButtonForm(
      {@required this.groupValue,
      @required this.value,
      @required this.onChanged,
      this.title = ''});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Radio<dynamic>(
          activeColor: Theme.of(context).primaryColor,
          value: value,
          groupValue: groupValue,
          onChanged: onChanged,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
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
