import 'package:flutter/material.dart';

class SimpleSliverAppBar extends StatelessWidget {
  final String title;
  final Widget leading;
  final Widget action;

  SimpleSliverAppBar({@required this.title, this.action, this.leading});

  Widget build(BuildContext context) {
    return SliverAppBar(
      forceElevated: true,
      backgroundColor: Colors.blue[900],
      centerTitle: true,
      pinned: false,
      snap: false,
      floating: true,
      leading: leading != null ? leading : Container(),
      title: Text(title),
      actions: <Widget>[
        action != null ? action : Container(),
      ],
    );
  }
}
