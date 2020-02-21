import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/shared/widgets/cards/event_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsLists extends StatelessWidget {
  final EventsController _eventsController = Modular.get<EventsController>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (_eventsController.filteredEvents.isEmpty) {
        return Text('Nenhum evento encontrado');
      }
      return ListView.separated(
        padding: EdgeInsets.zero,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        separatorBuilder: (BuildContext context, int index) => SizedBox(
          height: 20.0,
        ),
        itemCount: _eventsController.filteredEvents.length,
        itemBuilder: (BuildContext context, int index) {
          return EventCard(event: _eventsController.filteredEvents[index]);
        },
      );
    });
  }
}
