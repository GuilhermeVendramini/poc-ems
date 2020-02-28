import 'package:flutter/material.dart';

class DefaultBlockTitle extends StatelessWidget {
  final String text;
  final int maxLines;

  DefaultBlockTitle({@required this.text, this.maxLines = 2});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontSize: 18.0,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
