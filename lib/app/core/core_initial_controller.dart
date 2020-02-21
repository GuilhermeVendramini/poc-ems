import 'package:ems/app/services/events/events_service.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:mobx/mobx.dart';

part 'core_initial_controller.g.dart';

enum EventsStatus { IDLE, LOADING, ERROR, DONE }

class CoreInitialController = _CoreInitialBase with _$CoreInitialController;

abstract class _CoreInitialBase with Store {

  loadContents() {
    loadEvents();
    // loadFavorites();
    // loadBenefits();
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
      events = await _eventsService.getEvents();
      DateTime _now = DateTime.now();
      events = events.where((event) => event.date
          .isAfter(DateTime(_now.year, _now.month, _now.day)))
          .toList();
      eventsStatus = EventsStatus.DONE;
    } catch (e) {
      eventsStatus = EventsStatus.ERROR;
      print('Class CoreInitialController - loadEvents: $e');
    }
    return null;
  }
}
