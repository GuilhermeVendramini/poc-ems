import 'package:ems/app/modules/events/events_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

class EventsLists extends StatelessWidget {
  final EventsController _eventsController = Modular.get<EventsController>();

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (_eventsController.filteredEvents.isEmpty) {
          return Text('Nenhum evento encontrado');
        }
        return ListView(
          padding: EdgeInsets.zero,
          physics: NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          children: _eventsController.filteredEvents
              .map((event) => Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0.8),
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    margin: const EdgeInsets.symmetric(
                      vertical: 4.0,
                    ),
                    child: ListTile(
                      title: Text(event.title),
                      onTap: () => print('$event tapped!'),
                    ),
                  ))
              .toList(),
        );
      },
    );
  }
}
