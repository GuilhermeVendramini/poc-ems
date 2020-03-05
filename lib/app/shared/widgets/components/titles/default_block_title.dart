import 'package:flutter/material.dart';

class DefaultBlockTitle extends StatelessWidget {
  final String text;
  final int maxLines;
  final double fontSize;

  DefaultBlockTitle(
      {@required this.text, this.maxLines = 2, this.fontSize = 18.0});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black54,
        fontSize: fontSize,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
