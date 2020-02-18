import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_events_repository.dart';
import 'package:ems/app/shared/models/event_model.dart';

class EventsService {
  final FirestoreEventsRepository _eventsRepository =
      FirestoreEventsRepository();

  Future<List<EventModel>> getEvents({limit = 25}) async {
    try {
      QuerySnapshot _result = await _eventsRepository.loadEvents(limit: limit);
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        return _documents.map((doc) => EventModel.fromFirestore(doc)).toList();
      }
      return null;
    } catch (e) {
      print('Class EventsService - getEvents: $e');
      return null;
    }
  }
}
