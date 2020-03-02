import 'package:ems/app/services/trails/trails_service.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'trail_controller.g.dart';

enum TrailStatus { IDLE, LOADING, ERROR, DONE }

class TrailController = _TrailBase with _$TrailController;

abstract class _TrailBase with Store {
  @observable
  TrailModel trail;

  @observable
  String trailsCategory;

  @observable
  TrailStatus trailStatus = TrailStatus.IDLE;

  TrailsService _trailsService = TrailsService();

  @action
  Future<Null> loadTrailById({@required int id, @required int trailId}) async {
    try {
      trailStatus = TrailStatus.LOADING;
      trail = await _trailsService.getTrailById(id: id, trailId: trailId);
      trailStatus = TrailStatus.DONE;
    } catch (e) {
      trailStatus = TrailStatus.ERROR;
      print('Class TrailController -loadTrailsById: $e');
    }
    return null;
  }
}
