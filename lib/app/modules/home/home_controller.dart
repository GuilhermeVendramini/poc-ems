import 'package:ems/app/services/benefits/events_service.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

enum EventsStatus { IDLE, LOADING, ERROR, DONE }

class HomeController = _HomeBase with _$HomeController;

abstract class _HomeBase with Store {

  _HomeBase() {
    loadEvents();
  }

  @observable
  List<EventModel> events = ObservableList<EventModel>();

  @observable
  EventsStatus eventsStatus = EventsStatus.IDLE;

  EventsService _eventsService = EventsService();

  @action
  Future<Null> loadEvents() async {
    try {
      eventsStatus = EventsStatus.LOADING;
      events = await _eventsService.getEvents(limit: 4);
      eventsStatus = EventsStatus.DONE;
    } catch (e) {
      eventsStatus = EventsStatus.ERROR;
      print('Class HomeController - loadEvents: $e');
    }
    return null;
  }
}
