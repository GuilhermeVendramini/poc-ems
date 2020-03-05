import 'package:flutter/material.dart';

class BenefitsProfileLevel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<int> level = [1, 2, 3, 4, 5];
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(
          '4.0',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 8.0,
        ),
        for (var i in level)
          Icon(
            Icons.whatshot,
            size: 18.0,
            color: i != 5 ? Colors.amber : Colors.white,
          ),
      ],
    );
  }
}
