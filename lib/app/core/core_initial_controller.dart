import 'package:ems/app/services/benefits/benefits_service.dart';
import 'package:ems/app/services/events/events_service.dart';
import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:mobx/mobx.dart';

part 'core_initial_controller.g.dart';

enum EventsStatus { IDLE, LOADING, ERROR, DONE }
enum BenefitsStatus { IDLE, LOADING, ERROR, DONE }

class CoreInitialController = _CoreInitialBase with _$CoreInitialController;

abstract class _CoreInitialBase with Store {
  loadContents() {
    loadEvents();
    loadBenefits();
  }

  int initialIndexTab = 0;

  /*
  * Events
  * */

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
      events = events
          .where((event) =>
              event.date.isAfter(DateTime(_now.year, _now.month, _now.day)))
          .toList();
      eventsStatus = EventsStatus.DONE;
    } catch (e) {
      eventsStatus = EventsStatus.ERROR;
      print('Class CoreInitialController - loadEvents: $e');
    }
    return null;
  }

  /*
  * Benefits
  * */

  @observable
  List<BenefitModel> benefits = ObservableList<BenefitModel>();
  @observable
  BenefitsStatus benefitsStatus = BenefitsStatus.IDLE;
  BenefitsService _benefitsService = BenefitsService();

  @action
  Future<Null> loadBenefits() async {
    try {
      benefitsStatus = BenefitsStatus.LOADING;
      benefits = await _benefitsService.getBenefits();
      benefitsStatus = BenefitsStatus.DONE;
    } catch (e) {
      benefitsStatus = BenefitsStatus.ERROR;
      print('Class CoreInitialController - loadBenefits: $e');
    }
    return null;
  }
}
