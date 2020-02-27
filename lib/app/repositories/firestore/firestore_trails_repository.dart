import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_instance.dart';

class FirestoreTrailsRepository {
  Firestore firestore = FirestoreService.firestore;

  Future<QuerySnapshot> loadTrails() {
    return firestore
        .collection("app.services.trails")
        .getDocuments();
  }

  Future<QuerySnapshot> loadTrailById(int id) {
    return firestore
        .collection("app.services.trails")
        .where("id", isEqualTo: id)
        .limit(1)
        .getDocuments();
  }
}
