import 'package:flutter/material.dart';

class DefaultBody extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;

  DefaultBody({
    @required this.text,
    this.fontSize = 16.0,
    this.color = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        letterSpacing: 1.0,
        wordSpacing: 1.0,
      ),
    );
  }
}
