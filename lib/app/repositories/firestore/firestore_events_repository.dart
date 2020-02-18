import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_instance.dart';
import 'package:flutter/foundation.dart';

class FirestoreEventsRepository {
  Firestore firestore = FirestoreService.firestore;

  Future<QuerySnapshot> loadEvents({@required limit}) {
    return firestore
        .collection("events")
        .limit(limit)
        .orderBy("date", descending: true)
        .getDocuments();
  }
}
