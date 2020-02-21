import 'package:ems/app/services/events/events_service.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:mobx/mobx.dart';

part 'event_controller.g.dart';

enum EventStatus { IDLE, LOADING, ERROR, DONE }

class EventController = _EventBase with _$EventController;

abstract class _EventBase with Store {
  @observable
  EventModel event;

  @observable
  EventStatus eventStatus = EventStatus.IDLE;

  EventsService _eventsService = EventsService();

  @action
  Future<Null> loadEventById(String id) async {
    try {
      eventStatus = EventStatus.LOADING;
      event = await _eventsService.getEventById(id);
      eventStatus = EventStatus.DONE;
    } catch (e) {
      eventStatus = EventStatus.ERROR;
      print('Class EventController - loadEventById: $e');
    }
    return null;
  }
}
