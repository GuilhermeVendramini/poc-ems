import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_avatar.dart';
import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_level.dart';
import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_modules.dart';
import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_name.dart';
import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_points.dart';
import 'package:ems/app/modules/trails/widgets/components/profile/trails_profile_progress.dart';
import 'package:ems/app/shared/widgets/buttons/default_flat_button.dart';
import 'package:flutter/material.dart';

class TrailsProfileBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _verticalDivider = Container(
      width: 1.0,
      height: 30.0,
      color: Colors.grey[200],
    );

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      elevation: 6.0,
      margin: EdgeInsets.only(bottom: 10.0),
      color: Colors.white,
      child: Container(
        width: double.maxFinite,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TrailsProfileAvatar(),
                SizedBox(
                  width: 10.0,
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      TrailsProfileName(),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          TrailsProfilePoints(),
                          _verticalDivider,
                          TrailsProfileModules(),
                          _verticalDivider,
                          TrailsProfileLevel(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.0,
            ),
            TrailsProfileProgress(),
            SizedBox(
              height: 10.0,
            ),
            DefaultFlatButton(
              textColor: Colors.lightBlue,
              buttonWidth: 160.0,
              onPressed: () {},
              text: 'Como juntar mais moedas?',
              textSize: 12.0,
              fontWeight: FontWeight.w300,
              textDecoration: TextDecoration.underline,
            ),
          ],
        ),
      ),
    );
  }
}
