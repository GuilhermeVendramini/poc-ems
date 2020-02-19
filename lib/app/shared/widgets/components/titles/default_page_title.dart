import 'package:flutter/material.dart';

class DefaultPageTitle extends StatelessWidget {

  final String text;

  DefaultPageTitle({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
