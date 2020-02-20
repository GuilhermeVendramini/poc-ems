import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/modules/events/widgets/lists/events_list.dart';
import 'package:ems/app/shared/widgets/components/titles/default_title_block.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    EventsController _eventsController = Modular.get<EventsController>();
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Observer(
            builder: (_) {
              return DefaultTitleBlock(
                text: _eventsController.eventsBlockTitle,
              );
            },
          ),
          SizedBox(
            height: 20.0,
          ),
          EventsLists(),
        ],
      ),
    );
  }
}
