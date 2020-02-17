import 'package:flutter/material.dart';

class DefaultRaisedButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;

  DefaultRaisedButton({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.buttonColor,
    this.textColor,
    this.splashColor,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: buttonColor,
      onPressed: onPressed,
      splashColor: splashColor,
      child: SizedBox(
        width: buttonWidth,
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
