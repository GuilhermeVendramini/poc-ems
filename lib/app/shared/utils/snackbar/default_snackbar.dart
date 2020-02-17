import 'package:flutter/material.dart';

class DefaultSnackBar {
  DefaultSnackBar._();

  static BuildSnackBar({
    @required BuildContext context,
    int seconds = 3,
    @required String content,
    Color backgroundColor = Colors.white,
    Color contentColor = Colors.black,
  }) {
    return Scaffold.of(context).showSnackBar(
      SnackBar(
        backgroundColor: backgroundColor,
        content: Text(
          content,
          style: TextStyle(
            color: contentColor,
          ),
        ),
        duration: Duration(seconds: seconds),
      ),
    );
  }
}
