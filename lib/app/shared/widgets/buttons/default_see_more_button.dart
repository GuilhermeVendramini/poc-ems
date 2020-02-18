import 'package:ems/app/shared/widgets/buttons/default_flat_button.dart';
import 'package:flutter/material.dart';

class DefaultSeeMoreButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  DefaultSeeMoreButton({@required this.text, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return DefaultFlatButton(
      onPressed: onPressed,
      text: text,
      textColor: Colors.black54,
      textSize: 13.0,
      buttonWidth: 72.0,
    );
  }
}
