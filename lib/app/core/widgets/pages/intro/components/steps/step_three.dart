import 'package:ems/app/core/widgets/pages/intro/components/dots/dots.dart';
import 'package:ems/app/shared/widgets/buttons/default_flat_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(40.0),
            height: 180.0,
            width: screenWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                DotsSteps(page: 2),
                Text(
                  'Donec faucibus, mauris sit amet hendrerit bibendum, erat est vehicula velit, vel elementum augue nibh a mi.',
                  style: TextStyle(
                    color: _defaultColor,
                  ),
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
          DefaultFlatButton(
            shape: RoundedRectangleBorder(),
            color: Colors.blue,
            buttonWidth: screenWidth,
            buttonHeight: 60,
            textColor: _defaultColor,
            onPressed: () {
              Modular.to.pushReplacementNamed('/login');
            },
            text: 'Entrar',
          ),
        ],
      ),
    );
  }
}
