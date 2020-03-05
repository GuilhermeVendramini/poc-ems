import 'package:ems/app/modules/trails/widgets/blocks/trails_profile_block.dart';
import 'package:flutter/material.dart';

class TrailsHeaderBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: <Widget>[
        Container(
          height: 160.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue[900], Colors.indigo[900]],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        TrailsProfileBlock(),
      ],
    );
  }
}
