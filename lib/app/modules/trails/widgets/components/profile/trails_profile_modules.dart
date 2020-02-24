import 'package:flutter/material.dart';

class TrailsProfileModules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '1',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Módulos \nfeitos',
          style: TextStyle(
            fontSize: 10.0,
            color: Colors.grey,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
