import 'package:flutter/material.dart';

class DefaultIconButton extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final Function action;

  DefaultIconButton({
    @required this.icon,
    @required this.action,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
      ),
      onPressed: action,
    );
  }
}
