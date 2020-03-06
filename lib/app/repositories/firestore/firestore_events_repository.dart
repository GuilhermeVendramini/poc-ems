import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_instance.dart';

class FirestoreEventsRepository {
  Firestore firestore = FirestoreService.firestore;

  Future<QuerySnapshot> loadEvents() {
    return firestore
        .collection("events")
        .orderBy("date", descending: true)
        .getDocuments();
  }

  Future<QuerySnapshot> loadEventById(int id) {
    return firestore
        .collection("events")
        .where("id", isEqualTo: id)
        .orderBy("date", descending: true)
        .limit(1)
        .getDocuments();
  }
}
