import 'package:flutter/material.dart';

class DefaultDisplayDate extends StatelessWidget {

  final DateTime dateTime;
  final Color color;
  final double fontSize;

  DefaultDisplayDate({@required this.dateTime, this.color, this.fontSize});

  @override
  Widget build(BuildContext context) {
    return  Text(
      '${dateTime.day}/${dateTime.month}/${dateTime.year}',
      style: TextStyle(
        color: color,
        fontWeight: FontWeight.bold,
        fontSize: fontSize,
      ),
    );
  }
}
