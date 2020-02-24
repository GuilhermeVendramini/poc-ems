import 'package:flutter/material.dart';

class TrailsProfileLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Icon(
          Icons.stars,
          color: Colors.amber,
          size: 18.0,
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Nível ouro',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
