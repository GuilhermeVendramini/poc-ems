import 'package:ems/app/repositories/hive/hive_instance.dart';
import 'package:ems/app/repositories/hive/hive_trails/models_adapters/hive_trail_model.dart';
import 'package:ems/app/repositories/hive/hive_trails/models_adapters/hive_trails_model.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:ems/app/shared/models/trails_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveTrailsRepository {
  Box<Map> _trailsBox;
  List<TrailsModel> trails;

  Future<Null> loadTrailsBox() async {
    if (_trailsBox == null) {
      try {
        await HiveInstance.initHive();
        Hive.registerAdapter(HiveTrailModelAdapter());
        Hive.registerAdapter(HiveTrailsModelAdapter());
        _trailsBox = await Hive.openBox<Map>('trailsBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveTrails({
    @required List<TrailsModel> trails,
    Duration cache = const Duration(days: 1),
  }) async {
    await loadTrailsBox();
    List<HiveTrailsModel> _listHiveTrailsModel = trails
        .map((trailGroup) => HiveTrailsModel(
              title: trailGroup.title,
              id: trailGroup.id,
              trails: trailGroup.trails
                  .map((trail) => HiveTrailModel(
                        id: trail.id,
                        title: trail.title,
                        status: trail.status,
                        score: trail.score,
                        image: trail.image,
                        modules: trail.modules,
                        category: trailGroup.title,
                      ))
                  .toList(),
              category: trailGroup.category,
            ))
        .toList();

    _trailsBox.put(
      'trails',
      {'data': _listHiveTrailsModel, 'cache_expire': DateTime.now().add(cache)},
    );
    return;
  }

  Future<Null> deleteTrails() async {
    await loadTrailsBox();
    await _trailsBox.delete('trails');
    return;
  }

  Future<bool> expiredCache() async {
    await loadTrailsBox();
    if (_trailsBox.isNotEmpty) {
      DateTime cache = _trailsBox.get('trails')['cache_expire'];

      if (cache.isBefore(DateTime.now())) {
        return true;
      }

      return false;
    }
    return true;
  }

  Future<List<TrailsModel>> getTrails() async {
    await loadTrailsBox();
    if (_trailsBox.isNotEmpty) {
      List<dynamic> _hiveTrails = _trailsBox.get('trails')['data'];
      trails = _hiveTrails
          .map<TrailsModel>((trail) => TrailsModel(
                id: trail.id,
                category: trail.category,
                trails: trail.trails,
                title: trail.title,
              ))
          .toList();
      return trails;
    }
    return null;
  }

  Future<TrailModel> getTrailById(
      {@required int id, @required int trailId}) async {
    if (trails != null) {
      TrailsModel _trails = trails.firstWhere((trail) => trail.id == id);
      TrailModel _trail =
          _trails.trails.firstWhere((trail) => trail.id == trailId);
      return _trail;
    }
    return null;
  }
}
