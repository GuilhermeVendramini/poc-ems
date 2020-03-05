import 'package:flutter/material.dart';

class BenefitsProfileUsedCoupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '23',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Cupons \nusados',
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
