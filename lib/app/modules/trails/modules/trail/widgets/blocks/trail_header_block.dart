import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:ems/app/shared/widgets/buttons/default_back_button.dart';
import 'package:ems/app/shared/widgets/components/titles/default_page_title.dart';
import 'package:ems/app/shared/widgets/components/titles/default_sub_title.dart';
import 'package:flutter/material.dart';

class TrailHeaderBlock extends StatelessWidget {
  final TrailModel trail;

  TrailHeaderBlock({@required this.trail});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          height: 300.0,
          width: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(trail.image),
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.all(20.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              end: Alignment.center,
              colors: [
                Colors.black,
                Colors.transparent,
              ],
            ),
          ),
          height: 301.0,
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultSubTitle(
                text: trail.category,
              ),
              SizedBox(
                height: 10.0,
              ),
              DefaultPageTitle(
                text: trail.title,
                textAlign: TextAlign.start,
              ),
            ],
          ),
        ),
        SafeArea(
          child: DefaultBackButton(),
        ),
      ],
    );
  }
}
