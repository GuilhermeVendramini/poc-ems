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
    List<EventModel> _events;
    _events = await _hiveEventsRepository.getEvents();

    if (_events != null && _events.length > 0) {
      _events.sort((a, b) => a.date.compareTo(b.date));
      return _events;
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

  Future<EventModel> getCachedEventById(int id) async {
    EventModel _event;
    _event = await _hiveEventsRepository.getEventById(id);

    return _event;
  }

  Future<EventModel> getEventById(int id) async {
    EventModel _event;

    try {
      bool expiredCache = await _hiveEventsRepository.expiredCache();

      if (!expiredCache) {
        _event = await getCachedEventById(id);
        return _event;
      }

      QuerySnapshot _result = await _eventsRepository.loadEventById(id);
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _event = _documents.map((doc) => EventModel.fromFirestore(doc)).first;
        return _event;
      }
      return null;
    } catch (e) {
      print('Class EventsService - getEventById: $e');
      _event = await getCachedEventById(id);
      return _event;
    }
  }
}
