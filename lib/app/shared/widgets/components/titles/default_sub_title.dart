import 'package:flutter/material.dart';

class DefaultSubTitle extends StatelessWidget {
  final String text;
  final int maxLines;

  DefaultSubTitle({@required this.text, this.maxLines = 4});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.amber,
        fontSize: 14.0,
      ),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
    );
  }
}
