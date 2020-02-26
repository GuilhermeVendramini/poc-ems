import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class DefaultCalendar extends StatelessWidget {
  final CalendarController calendarController;
  final Function onDaySelected;
  final Function onVisibleDaysChanged;
  final Map<DateTime, List> events;

  DefaultCalendar(
      {@required this.calendarController,
      this.onDaySelected,
      this.onVisibleDaysChanged,
      this.events});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      locale: 'pt-BR',
      events: events,
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle(
          color: Colors.grey,
        ),
        weekdayStyle: TextStyle(
          color: Colors.white,
        ),
      ),
      calendarStyle: CalendarStyle(
        markersColor: Colors.white,
        outsideStyle: TextStyle(color: Colors.black38),
        outsideWeekendStyle: TextStyle(
          color: Colors.black38,
        ),
        weekdayStyle: TextStyle(
          color: Colors.white,
        ),
        weekendStyle: TextStyle(
          color: Colors.grey,
        ),
      ),
      headerStyle: HeaderStyle(
        leftChevronIcon: Icon(
          Icons.navigate_before,
          color: Colors.white,
        ),
        rightChevronIcon: Icon(
          Icons.navigate_next,
          color: Colors.white,
        ),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      calendarController: calendarController,
      onDaySelected: onDaySelected,
      onVisibleDaysChanged: onVisibleDaysChanged,
    );
  }
}
