import 'package:flutter/material.dart';

class DefaultPageTitle extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final int maxLines;

  DefaultPageTitle(
      {@required this.text,
      this.textAlign = TextAlign.center,
      this.maxLines = 4});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
