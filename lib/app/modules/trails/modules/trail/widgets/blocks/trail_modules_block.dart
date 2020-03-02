import 'package:ems/app/modules/trails/modules/trail/widgets/lists/trail_modules_list.dart';
import 'package:ems/app/modules/trails/widgets/components/progress_indicator/trails_progress_indicator.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class TrailModulesBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(60.0),
              ),
            ),
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                DefaultBlockTitle(
                  text: 'Módulos',
                ),
                SizedBox(
                  height: 20.0,
                ),
                TrailModulesList(),
              ],
            ),
          ),
        ),
        TrailsProgressIndicator(),
      ],
    );
  }
}
