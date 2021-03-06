import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StepThree extends StatelessWidget {
  final double screenWidth;
  final PageController pageController;

  StepThree({@required this.screenWidth, @required this.pageController});

  final Color _defaultColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.zero,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/doctor3.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(40.0),
        height: 240.0,
        width: screenWidth,
        child: Column(
          children: <Widget>[
            Text(
              'Proin facilisis nisi in felis fermentum tristique',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: _defaultColor,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              'Duis laoreet sodales tristique. Cras eget aliquet neque, eu tincidunt odio.',
              style: TextStyle(
                color: _defaultColor,
              ),
            ),
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(40.0),
          ),
          color: Colors.blue,
          gradient: LinearGradient(
            colors: [Colors.blue[900], Colors.indigo[900]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
      ),
    );
  }
}
