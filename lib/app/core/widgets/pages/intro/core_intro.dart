import 'package:ems/app/core/widgets/pages/intro/components/steps/step_three.dart';
import 'package:ems/app/core/widgets/pages/intro/components/steps/step_two.dart';
import 'package:ems/app/shared/utils/screen_configs/portrait_screen.dart';
import 'package:flutter/material.dart';
import 'package:i18n_extension/i18n_widget.dart';

import 'components/steps/step_one.dart';

class CoreIntro extends StatefulWidget {
  @override
  _CoreIntroState createState() => _CoreIntroState();
}

class _CoreIntroState extends State<CoreIntro> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    double _screenWidth = _screenSize.width;
    double _screenHeight = _screenSize.height;

    portraitScreen();

    return I18n(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            width: _screenWidth,
            height: _screenHeight,
            child: SafeArea(
              child: PageView(
                controller: _pageController,
                children: <Widget>[
                  StepOne(
                    screenWidth: _screenWidth,
                    pageController: _pageController,
                  ),
                  StepTwo(
                    screenWidth: _screenWidth,
                    pageController: _pageController,
                  ),
                  StepThree(
                    screenWidth: _screenWidth,
                    pageController: _pageController,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
