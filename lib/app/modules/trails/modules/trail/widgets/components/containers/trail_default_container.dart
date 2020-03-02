import 'package:flutter/material.dart';

class TrailDefaultContainer extends StatelessWidget {
  final Widget widget;

  TrailDefaultContainer({@required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(20.0),
      child: widget,
    );
  }
}
