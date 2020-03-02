import 'package:ems/app/services/modules/modules_service.dart';
import 'package:ems/app/services/trails/trails_service.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:mobx/mobx.dart';

part 'trail_controller.g.dart';

enum TrailStatus { IDLE, LOADING, ERROR, DONE }
enum ModulesStatus { IDLE, LOADING, ERROR, DONE }

class TrailController = _TrailBase with _$TrailController;

abstract class _TrailBase with Store {
  @observable
  TrailModel trail;

  @observable
  List<ModuleModel> modules = ObservableList<ModuleModel>();

  @observable
  String trailsCategory;

  @observable
  TrailStatus trailStatus = TrailStatus.IDLE;

  @observable
  ModulesStatus modulesStatus = ModulesStatus.IDLE;

  TrailsService _trailsService = TrailsService();
  ModulesService _modulesService = ModulesService();

  @action
  Future<Null> loadTrailById({@required int id, @required int trailId}) async {
    try {
      trailStatus = TrailStatus.LOADING;
      trail = await _trailsService.getTrailById(id: id, trailId: trailId);
      if (trail != null && trail.modules.length > 0) {
        loadModulesByIds(trail.modules);
      }
      trailStatus = TrailStatus.DONE;
    } catch (e) {
      trailStatus = TrailStatus.ERROR;
      print('Class TrailController -loadTrailsById: $e');
    }
    return null;
  }

  @action
  Future<Null> loadModulesByIds(List<int> ids) async {
    try {
      modulesStatus = ModulesStatus.LOADING;
      modules = await _modulesService.getModulesByIds(ids);
      modulesStatus = ModulesStatus.DONE;
    } catch (e) {
      modulesStatus = ModulesStatus.ERROR;
      print('Class TrailController - loadModulesByIds: $e');
    }
    return null;
  }
}
