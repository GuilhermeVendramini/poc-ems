import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class IntroForwardButton extends AnimatedWidget {
  final PageController pageController;
  final int itemCount;

  IntroForwardButton({
    @required this.pageController,
    @required this.itemCount,
  }) : super(listenable: pageController);

  @override
  Widget build(BuildContext context) {
    if (pageController.hasClients &&
        pageController.page != null &&
        pageController.page.floor() == itemCount - 1) {
      return RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        onPressed: () {
          Modular.to.pushReplacementNamed('/login');
        },
        child: Row(
          children: <Widget>[
            Text('Iniciar'),
            Icon(Icons.arrow_forward),
          ],
        ),
      );
    }

    return RaisedButton(
      padding: EdgeInsets.all(10.0),
      shape: CircleBorder(),
      onPressed: () {
        if (pageController.hasClients) {
          pageController.animateToPage(
            pageController.page.floor() + 1,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
          );
        }
      },
      child: Icon(
        Icons.arrow_forward,
      ),
    );
  }
}
