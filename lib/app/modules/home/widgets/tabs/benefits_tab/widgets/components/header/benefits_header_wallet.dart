import 'package:flutter/material.dart';

class BenefitsHeaderWallet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const Color _color = Colors.white;

    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        gradient: LinearGradient(
          colors: [
            Colors.yellow[800],
            Colors.yellow[900],
            Colors.redAccent,
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Minha carteira:',
                style: TextStyle(
                  color: _color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'moedas',
                style: TextStyle(
                  color: _color,
                ),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.offline_bolt,
                color: _color,
                size: 28.0,
              ),
              SizedBox(
                width: 4.0,
              ),
              Text(
                '1400',
                style: TextStyle(
                  color: _color,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
