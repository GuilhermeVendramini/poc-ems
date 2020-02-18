import 'package:flutter/material.dart';

class DefaultFlatButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final double buttonHeight;
  final Color color;
  final Color textColor;
  final Color splashColor;
  final Function onPressed;
  final ShapeBorder shape;
  final double textSize;

  DefaultFlatButton({
    @required this.text,
    @required this.onPressed,
    this.shape,
    this.buttonWidth = 150.0,
    this.buttonHeight,
    this.color,
    this.textColor,
    this.splashColor,
    this.textSize,
  });

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      color: color,
      shape: shape,
      onPressed: onPressed,
      splashColor: splashColor,
      child: Container(
        alignment: Alignment.center,
        height: buttonHeight,
        width: buttonWidth,
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: textSize,
          ),
        ),
      ),
    );
  }
}
