import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_instance.dart';

class FirestoreModulesRepository {
  Firestore firestore = FirestoreService.firestore;

  Future<QuerySnapshot> loadModulesByIds(List<int> ids) {
    return firestore
        .collection("modules")
        .where("id", whereIn: ids)
        .getDocuments();
  }

  Future<QuerySnapshot> loadModuleById(int id) {
    return firestore
        .collection("modules")
        .where("id", isEqualTo: id)
        .limit(1)
        .getDocuments();
  }
}
