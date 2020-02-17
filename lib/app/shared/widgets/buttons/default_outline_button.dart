import 'package:flutter/material.dart';

class DefaultOutlineButton extends StatelessWidget {
  final String text;
  final double buttonWidth;
  final Color textColor;
  final Color splashColor;
  final Color highlightedBorderColor;
  final Function onPressed;
  final ShapeBorder shape;

  DefaultOutlineButton({
    @required this.text,
    @required this.onPressed,
    this.buttonWidth = 150.0,
    this.textColor,
    this.splashColor,
    this.highlightedBorderColor,
    this.shape,
  });

  @override
  Widget build(BuildContext context) {
    return OutlineButton(
      shape: shape,
      onPressed: onPressed,
      splashColor: splashColor,
      highlightedBorderColor: highlightedBorderColor,
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
