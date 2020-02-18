import 'package:flutter/material.dart';

class DefaultRaisedButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color buttonColor;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;
  final ShapeBorder shape;

  DefaultRaisedButton({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.buttonColor,
    this.textColor,
    this.splashColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: shape != null ? shape : RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
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
