import 'package:ems/app/modules/trails/modules/trail/widgets/blocks/trail_header_block.dart';
import 'package:ems/app/modules/trails/modules/trail/widgets/blocks/trail_modules_block.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/material.dart';

class TrailMainBlock extends StatelessWidget {
  final TrailModel trail;

  TrailMainBlock({@required this.trail});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        TrailHeaderBlock(
          trail: trail,
        ),
        TrailModulesBlock(
          modules: trail.modules,
        ),
      ],
    );
  }
}
