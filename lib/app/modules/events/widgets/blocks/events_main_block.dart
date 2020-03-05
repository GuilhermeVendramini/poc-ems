import 'package:ems/app/modules/events/events_controller.dart';
import 'package:ems/app/modules/events/widgets/blocks/events_block.dart';
import 'package:ems/app/shared/widgets/appbar/simple_sliver_app_bar.dart';
import 'package:ems/app/shared/widgets/calendar/default_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

class EventsMainBlock extends StatefulWidget {
  @override
  _EventsMainBlockState createState() => _EventsMainBlockState();
}

class _EventsMainBlockState extends State<EventsMainBlock> {
  EventsController _eventsController;

  CalendarController _calendarController;
  DateTime _currentDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    _eventsController = Modular.get<EventsController>();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime dateTime, List events) {
    setState(() {
      if (DateFormat.yMMMd().format(_currentDay) ==
          DateFormat.yMMMd().format(dateTime)) {
        _calendarController.setSelectedDay(DateTime.now());
        _eventsController.filterEvents();
      } else {
        _eventsController.filterEvents(dateTime: dateTime);
        _currentDay = dateTime;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SimpleSliverAppBar(
          title: 'EVENTOS',
        ),
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(60.0),
                ),
                gradient: LinearGradient(
                  colors: [Colors.blue[900], Colors.indigo[900]],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Observer(
                builder: (_) {
                  return DefaultCalendar(
                    calendarController: _calendarController,
                    onDaySelected: _onDaySelected,
                    events: _eventsController.getCalendarEvents(),
                  );
                },
              ),
            ),
            EventsBlock(),
          ]),
        ),
      ],
    );
  }
}
