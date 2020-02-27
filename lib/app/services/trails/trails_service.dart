import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_trails_repository.dart';
import 'package:ems/app/repositories/hive/hive_trails/hive_trails_instance.dart';
import 'package:ems/app/repositories/hive/hive_trails/hive_trails_repository.dart';
import 'package:ems/app/shared/models/trails_model.dart';

class TrailsService {
  final FirestoreTrailsRepository _trailsRepository =
      FirestoreTrailsRepository();

  final HiveTrailsRepository _hiveTrailsRepository =
      HiveTrailsInstance.repository;

  Future<List<TrailsModel>> getCachedTrails() async {
    List<TrailsModel> _trails;
    _trails = await _hiveTrailsRepository.getTrails();

    if (_trails != null && _trails.length > 0) {
      return _trails;
    }

    return null;
  }

  Future<List<TrailsModel>> getTrails() async {
    List<TrailsModel> _trails;

    //try {
      bool expiredCache = await _hiveTrailsRepository.expiredCache();

      if (!expiredCache) {
        _trails = await getCachedTrails();
        return _trails;
      }

      QuerySnapshot _result = await _trailsRepository.loadTrails();
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _trails =
            _documents.map((doc) => TrailsModel.fromFirestore(doc)).toList();
        _hiveTrailsRepository.saveTrails(trails: _trails);
        return _trails;
      }
      return null;
/*    } catch (e) {
      print('Class TrailsService - getTrails: $e');
      _trails = await getCachedTrails();
      return _trails;
    }*/
  }
}
