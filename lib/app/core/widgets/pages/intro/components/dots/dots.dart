import 'package:flutter/material.dart';

class DotsSteps extends StatelessWidget {

  final double page;

  DotsSteps({@required this.page});

  @override
  Widget build(BuildContext context) {

    final Color _defaultColor = Colors.white;

    return  Row(
      children: <Widget>[
        Icon(
          page == 0 ? Icons.brightness_1 : Icons.radio_button_unchecked,
          size: 20.0,
          color: _defaultColor,
        ),
        Icon(
          page == 1 ? Icons.brightness_1 : Icons.radio_button_unchecked,
          size: 20.0,
          color: _defaultColor,
        ),
        Icon(
          page == 2 ? Icons.brightness_1 : Icons.radio_button_unchecked,
          size: 20.0,
          color: _defaultColor,
        ),
      ],
    );
  }
}
