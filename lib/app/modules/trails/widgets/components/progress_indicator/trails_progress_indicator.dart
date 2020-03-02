import 'package:flutter/material.dart';

class TrailsProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey[400],
                blurRadius: 10.0,
                offset: Offset(
                  2.0,
                  4.0,
                ),
              )
            ],
          ),
          width: MediaQuery.of(context).size.width * 0.65,
          height: 20.0,
          child: ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
            child: LinearProgressIndicator(
              backgroundColor: Colors.white,
              valueColor: AlwaysStoppedAnimation<Color>(
                Colors.lightBlueAccent,
              ),
              value: 0.4,
            ),
          ),
        ),
        SizedBox(
          height: 8.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.stars,
              color: Colors.blue,
              size: 15.0,
            ),
            SizedBox(
              width: 4.0,
            ),
            Text(
              '400',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: 13.0,
              ),
            ),
            Text(
              ' / 1000 pts',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
