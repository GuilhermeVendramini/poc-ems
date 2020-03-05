import 'package:flutter/material.dart';

class BenefitsProfilePoints extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final int userScore = 100;

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
              userScore.toString().length <= 5
                  ? userScore.toString()
                  : '+ ${userScore.toString().substring(0, 5)}',
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
          'Pontos nas \ntrilhas',
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
