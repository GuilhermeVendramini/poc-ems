import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Function onPressed;

  DefaultIconButton({
    @required this.icon,
    @required this.onPressed,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: onPressed,
    );
  }
}
