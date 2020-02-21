import 'package:ems/app/repositories/hive/hive_events/models_adapters/hive_event_model.dart';
import 'package:ems/app/shared/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveEventsRepository {
  Box<List> _eventsBox;
  Box<DateTime> _eventsBoxCache;

  Future<Null> loadEventsBox() async {
    if (_eventsBox == null && _eventsBoxCache == null) {
      try {
        var dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
        Hive.registerAdapter(HiveEventModelAdapter());
        _eventsBox = await Hive.openBox<List>('eventsBox');
        _eventsBoxCache = await Hive.openBox<DateTime>('eventsBoxCache');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveEvents({@required List<EventModel> events}) async {
    await loadEventsBox();
    List<HiveEventModel> _hiveEventModel = events
        .map((event) => HiveEventModel(
              title: event.title,
              id: event.id,
              image: event.image,
              body: event.body,
              date: event.date,
              description: event.description,
            ))
        .toList();

    _eventsBoxCache.put(
      'cache',
      DateTime.now().add(Duration(days: 1)),
    );

    _eventsBox.put(
      'events',
      _hiveEventModel,
    );
    return;
  }

  Future<Null> deleteEvents() async {
    await loadEventsBox();
    await _eventsBox.delete('events');
    await _eventsBoxCache.delete('cache');
    return;
  }

  Future<List<EventModel>> getEvents() async {
    await loadEventsBox();
    if (_eventsBox.isNotEmpty && _eventsBoxCache.isNotEmpty) {
      DateTime cache = _eventsBoxCache.get('cache');
      if (cache.isBefore(DateTime.now())) {
        return null;
      }

      List<EventModel> _events = _eventsBox
          .get('events')
          .map((event) => EventModel(
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
}
