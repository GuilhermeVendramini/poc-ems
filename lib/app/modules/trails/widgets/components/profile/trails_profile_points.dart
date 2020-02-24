import 'package:flutter/material.dart';

class TrailsProfilePoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(
              Icons.stars,
              color: Colors.blue,
              size: 18.0,
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              '100',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Pontos',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
