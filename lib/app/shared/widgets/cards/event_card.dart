import 'package:cached_network_image/cached_network_image.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:ems/app/shared/widgets/components/dates/default_display_date.dart';
import 'package:ems/app/shared/widgets/components/titles/default_block_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventCard extends StatelessWidget {
  final EventModel event;

  EventCard({@required this.event});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(10.0),
        onTap: () {
          Modular.to.pushNamed('/event/${event.id}');
        },
        child: Column(
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10.0),
                  topLeft: Radius.circular(10.0),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(event.image),
                ),
              ),
              height: 150.0,
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  DefaultDisplayDate(
                    dateTime: event.date,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  DefaultBlockTitle(
                    text: event.title,
                    fontSize: 16.0,
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    event.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
