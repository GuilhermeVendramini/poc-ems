import 'package:ems/app/services/benefits/events_service.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

part 'events_controller.g.dart';

enum EventsStatus { IDLE, LOADING, ERROR, DONE }

class EventsController = _EventsBase with _$EventsController;

abstract class _EventsBase with Store {
  _EventsBase() {
    loadEvents();
  }

  @observable
  List<EventModel> events = ObservableList<EventModel>();

  @observable
  List<EventModel> filteredEvents = ObservableList<EventModel>();

  @observable
  EventsStatus eventsStatus = EventsStatus.IDLE;

  @observable
  String eventsBlockTitle = 'Próximos eventos';

  EventsService _eventsService = EventsService();

  @action
  Future<Null> loadEvents() async {
    try {
      eventsStatus = EventsStatus.LOADING;
      events = await _eventsService.getEvents();
      filteredEvents = events
          .where((event) => event.date.toDate().isAfter(DateTime.now()))
          .toList();
      eventsStatus = EventsStatus.DONE;
    } catch (e) {
      eventsStatus = EventsStatus.ERROR;
      print('Class EventsController - loadEvents: $e');
    }
    return null;
  }

  Map<DateTime, List> getCalendarEvents() {
    Map<DateTime, List> mappedEvents = Map<DateTime, List>();
    events.forEach((event) {
      DateTime dateTime = event.date.toDate();
      DateTime eventDate =
          DateTime(dateTime.year, dateTime.month, dateTime.day);
      if (mappedEvents[eventDate] == null) {
        mappedEvents.putIfAbsent(eventDate, () => [event]);
      } else {
        mappedEvents[eventDate].add(event);
      }
    });

    return mappedEvents;
  }

  @action
  void filterEvents({DateTime dateTime}) {
    if (dateTime != null) {
      eventsBlockTitle = 'Eventos do dia ${dateTime.day}/${dateTime.month}/${dateTime.year}';
      filteredEvents = events
          .where((event) =>
              DateFormat.yMMMd().format(event.date.toDate()) ==
              DateFormat.yMMMd().format(dateTime))
          .toList();
    } else {
      eventsBlockTitle = 'Próximos eventos';
      DateTime now = DateTime.now();
      filteredEvents = events
          .where((event) => event.date
              .toDate()
              .isAfter(DateTime(now.year, now.month, now.day)))
          .toList();
    }
  }
}
