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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Stack(
          children: <Widget>[
            DefaultVideoPlayer(
              video:
                  'https://file-examples.com/wp-content/uploads/2017/04/file_example_MP4_480_1_5MG.mp4',
            ),
            SafeArea(
              child: DefaultBackButton(),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultBlockTitle(
                text: module.title,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultBody(
                text: module.body,
              )
            ],
          ),
        ),
      ],
    );
  }
}
