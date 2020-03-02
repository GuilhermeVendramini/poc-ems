import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/widgets/buttons/default_back_button.dart';
import 'package:ems/app/shared/widgets/components/body/default_body.dart';
import 'package:ems/app/shared/widgets/components/dates/default_display_date.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class EventMainBlock extends StatelessWidget {
  final EventModel event;

  EventMainBlock({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          alignment: Alignment.topLeft,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: CachedNetworkImageProvider(event.image),
            ),
          ),
          height: 300.0,
          width: double.maxFinite,
          child: SafeArea(
            child: DefaultBackButton(),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DefaultBlockTitle(
                text: event.title,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultDisplayDate(
                dateTime: event.date,
                color: Colors.grey,
                fontSize: 16.0,
              ),
              SizedBox(
                height: 20.0,
              ),
              DefaultBody(
                text: event.body,
              )
            ],
          ),
        ),
      ],
    );
  }
}