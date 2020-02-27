import 'package:flutter/material.dart';

class DefaultBlockTitle extends StatelessWidget {
  final String text;

  DefaultBlockTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.black87,
        fontSize: 18.0,
      ),
    );
  }
}
