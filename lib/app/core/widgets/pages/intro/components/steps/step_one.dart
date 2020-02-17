import 'package:ems/app/core/widgets/pages/intro/components/buttons/forward_button.dart';
import 'package:ems/app/core/widgets/pages/intro/components/dots/dots.dart';
import 'package:flutter/material.dart';

class StepOne extends StatelessWidget {
  final double screenWidth;
  final PageController pageController;

  StepOne({@required this.screenWidth, @required this.pageController});

  final Color _defaultColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/doctor.png'),
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
              'Bem-vindo ao novo portal da EMS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
                color: _defaultColor,
              ),
            ),
            Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
              style: TextStyle(
                color: _defaultColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                DotsSteps(page: 0),
                ForwardButton(
                  pageController: pageController,
                  page: 1,
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
