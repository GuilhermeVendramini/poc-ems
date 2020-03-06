import 'package:ems/app/repositories/hive/hive_events/models_adapters/hive_event_model.dart';
import 'package:ems/app/repositories/hive/hive_instance.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveEventsRepository {
  Box<Map> _eventsBox;

  Future<Null> loadEventsBox() async {
    if (_eventsBox == null) {
      try {
        await HiveInstance.initHive();
        Hive.registerAdapter(HiveEventModelAdapter());
        _eventsBox = await Hive.openBox<Map>('eventsBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveEvents({
    @required List<EventModel> events,
    Duration cache = const Duration(days: 1),
  }) async {
    await loadEventsBox();
    List<HiveEventModel> _listHiveEventModel = events
        .map((event) => HiveEventModel(
              title: event.title,
              id: event.id,
              image: event.image,
              body: event.body,
              date: event.date,
              description: event.description,
            ))
        .toList();

    _eventsBox.put(
      'events',
      {'data': _listHiveEventModel, 'cache_expire': DateTime.now().add(cache)},
    );
    return;
  }

  Future<Null> deleteEvents() async {
    await loadEventsBox();
    await _eventsBox.delete('events');
    return;
  }

  Future<bool> expiredCache() async {
    await loadEventsBox();
    if (_eventsBox.isNotEmpty) {
      DateTime cache = _eventsBox.get('events')['cache_expire'];

      if (cache.isBefore(DateTime.now())) {
        return true;
      }

      return false;
    }
    return true;
  }

  Future<List<EventModel>> getEvents() async {
    await loadEventsBox();
    if (_eventsBox.isNotEmpty) {
      List<dynamic> _hiveEvents = _eventsBox.get('events')['data'];
      List<EventModel> _events = _hiveEvents
          .map<EventModel>((event) => EventModel(
                id: event.id,
                image: event.image,
                body: event.body,
                date: event.date,
                description: event.description,
                title: event.title,
              ))
          .toList();
      return _events;
    }
    return null;
  }

  Future<EventModel> getEventById(int id) async {
    await loadEventsBox();
    if (_eventsBox.isNotEmpty) {
      EventModel _event = _eventsBox
          .get('events')['data']
          .firstWhere((event) => event.id == id);

      return _event;
    }
    return null;
  }
}
