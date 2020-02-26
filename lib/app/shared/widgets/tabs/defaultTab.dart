import 'package:flutter/material.dart';

class DefaultTab extends StatelessWidget {
  final IconData icon;
  final String text;

  DefaultTab({@required this.icon, @required this.text});

  @override
  Widget build(BuildContext context) {
    return Tab(
      icon: Icon(icon),
      child: Text(
        text,
        style: TextStyle(fontSize: 10.0),
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
