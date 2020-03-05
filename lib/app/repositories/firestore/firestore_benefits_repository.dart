import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_instance.dart';

class FirestoreBenefitsRepository {
  Firestore firestore = FirestoreService.firestore;

  Future<QuerySnapshot> loadBenefits() {
    return firestore.collection("benefits").getDocuments();
  }

  Future<QuerySnapshot> loadBenefitById(int id) {
    return firestore
        .collection("benefits")
        .where("id", isEqualTo: id)
        .limit(1)
        .getDocuments();
  }
}
