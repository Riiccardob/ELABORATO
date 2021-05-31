import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const ButtonWidget({
    @required this.text,
    @required this.onClicked,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => RaisedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(Icons.payment),
            Text(
              text,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        shape: StadiumBorder(),
        color: Colors.blue,
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textColor: Colors.white,
        onPressed: onClicked,
      );
}
