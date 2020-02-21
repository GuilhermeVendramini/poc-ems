import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_events_repository.dart';
import 'package:ems/app/repositories/hive/hive_events/hive_events_instance.dart';
import 'package:ems/app/repositories/hive/hive_events/hive_events_repository.dart';
import 'package:ems/app/shared/models/event_model.dart';

class EventsService {
  final FirestoreEventsRepository _eventsRepository =
      FirestoreEventsRepository();

  final HiveEventsRepository _hiveEventsRepository =
      HiveEventsInstance.repository;

  Future<List<EventModel>> getCachedEvents() async {
    List<EventModel> events;
    events = await _hiveEventsRepository.getEvents();

    if (events != null && events.length > 0) {
      events.sort((a, b) => a.date.compareTo(b.date));
      return events;
    }

    return null;
  }

  Future<List<EventModel>> getEvents() async {
    List<EventModel> _events;
    try {
      bool expiredCache = await _hiveEventsRepository.expiredCache();

      if (!expiredCache) {
        _events = await getCachedEvents();
        return _events;
      }

      QuerySnapshot _result = await _eventsRepository.loadEvents();
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _events =
            _documents.map((doc) => EventModel.fromFirestore(doc)).toList();
        _hiveEventsRepository.saveEvents(events: _events);
        _events.sort((a, b) => a.date.compareTo(b.date));
        return _events;
      }
      return null;
    } catch (e) {
      print('Class EventsService - getEvents: $e');
      _events = await getCachedEvents();
      return _events;
    }
  }
}
