import 'package:ems/app/core/widgets/pages/intro/components/buttons/forward_button.dart';
import 'package:ems/app/core/widgets/pages/intro/components/dots/dots.dart';
import 'package:flutter/material.dart';

class StepTwo extends StatelessWidget {
  final double screenWidth;
  final PageController pageController;

  StepTwo({@required this.screenWidth, @required this.pageController});

  final Color _defaultColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/doctor2.png'),
          fit: BoxFit.fitHeight,
        ),
      ),
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: EdgeInsets.all(40.0),
        height: 240.0,
        width: screenWidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              'Proin facilisis nisi in felis fermentum tristique',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: _defaultColor,
              ),
            ),
            Text(
              'Duis laoreet sodales tristique. Cras eget aliquet neque, eu tincidunt odio.',
              style: TextStyle(
                color: _defaultColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DotsSteps(page: 1),
                ForwardButton(
                  pageController: pageController,
                  page: 2,
                ),
              ],
            ),
          ],
        ),
        decoration: BoxDecoration(
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
