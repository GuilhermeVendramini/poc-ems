import 'package:flutter/material.dart';

class DefaultLogo extends StatelessWidget {
  final double height;

  DefaultLogo({this.height = 180});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/ems.png'),
        ),
      ),
    );
  }
}
