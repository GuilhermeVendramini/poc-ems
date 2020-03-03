import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/widgets/appbar/default_sliver_appbar.dart';
import 'package:ems/app/shared/widgets/components/body/default_body.dart';
import 'package:ems/app/shared/widgets/components/dates/default_display_date.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';

class EventMainBlock extends StatelessWidget {
  final EventModel event;

  EventMainBlock({@required this.event});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverPersistentHeader(
          delegate: DefaultSliverAppBar(
            expandedHeight: 400,
            title: event.title,
            imagePath: event.image,
          ),
          pinned: true,
        ),
        SliverPadding(
          padding: EdgeInsets.all(20.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
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
              ),
            ]),
          ),
        ),
      ],
    );
  }
}
