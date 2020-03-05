import 'package:flutter/material.dart';

class BenefitsProfileAvailableCoupons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          '4',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18.0,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          'Cupons \ndisponíveis',
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
