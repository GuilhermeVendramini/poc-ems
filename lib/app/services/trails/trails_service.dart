import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_trails_repository.dart';
import 'package:ems/app/shared/models/trails_model.dart';

class TrailsService {
  final FirestoreTrailsRepository _trailsRepository =
      FirestoreTrailsRepository();

  Future<List<TrailsModel>> getTrails() async {
    List<TrailsModel> _trails;

    QuerySnapshot _result = await _trailsRepository.loadTrails();
    List<DocumentSnapshot> _documents = _result.documents;

    if (_documents.isNotEmpty) {
      _trails =
          _documents.map((doc) => TrailsModel.fromFirestore(doc)).toList();
      return _trails;
    }
    return null;
  }
}
