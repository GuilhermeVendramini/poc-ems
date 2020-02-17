import 'package:flutter/material.dart';

class ForwardButton extends StatelessWidget {

  final PageController pageController;
  final int page;

  ForwardButton({@required this.pageController, @required this.page});

  @override
  Widget build(BuildContext context) {
    return                 RaisedButton(
      color: Colors.indigo,
      padding: EdgeInsets.all(10.0),
      shape: CircleBorder(),
      onPressed: () {
        if (pageController.hasClients) {
          pageController.animateToPage(
            page,
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
          );
        }
      },
      child: Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
    );
  }
}
