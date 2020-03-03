import 'package:ems/app/shared/models/module_model.dart';
import 'package:ems/app/shared/widgets/buttons/default_back_button.dart';
import 'package:ems/app/shared/widgets/components/body/default_body.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:ems/app/shared/widgets/video_player/default_video_player.dart';
import 'package:flutter/material.dart';

class ModuleMainBlock extends StatelessWidget {
  final ModuleModel module;

  ModuleMainBlock({@required this.module});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverPadding(
              padding: EdgeInsets.only(bottom: 20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  DefaultVideoPlayer(
                    video: module.video,
                  ),
                ]),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.all(20.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  DefaultBlockTitle(
                    text: module.title,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  DefaultBody(
                    text: module.body,
                  ),
                ]),
              ),
            ),
          ],
        ),
        SafeArea(
          child: DefaultBackButton(),
        ),
      ],
    );
  }
}
