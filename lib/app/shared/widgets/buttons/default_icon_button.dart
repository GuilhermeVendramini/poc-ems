import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Function onPressed;
  final double size;

  DefaultIconButton(
      {@required this.icon,
      @required this.onPressed,
      this.iconColor,
      this.size});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
        size: size,
      ),
      onPressed: onPressed,
    );
  }
}
