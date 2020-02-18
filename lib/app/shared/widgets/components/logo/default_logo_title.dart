import 'package:flutter/material.dart';

class DefaultLogoTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'EDUCARDIO',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
