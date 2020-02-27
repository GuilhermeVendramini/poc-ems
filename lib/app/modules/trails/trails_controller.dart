import 'package:ems/app/services/trails/trails_service.dart';
import 'package:ems/app/shared/models/trails_model.dart';
import 'package:mobx/mobx.dart';

part 'trails_controller.g.dart';

enum TrailsStatus { IDLE, LOADING, ERROR, DONE }

class TrailsController = _TrailsBase with _$TrailsController;

abstract class _TrailsBase with Store {
  _TrailsBase() {
    loadTrails();
  }

  @observable
  TrailsStatus trailsStatus = TrailsStatus.IDLE;

  @observable
  List<TrailsModel> trails = ObservableList<TrailsModel>();

  TrailsService _trailsService = TrailsService();

  @action
  Future<Null> loadTrails() async {
    //try {
      trailsStatus = TrailsStatus.LOADING;
      trails = await _trailsService.getTrails();
      trailsStatus = TrailsStatus.DONE;
/*    } catch (e) {
      trailsStatus = TrailsStatus.ERROR;
      print('Class TrailsController - loadTrails: $e');
    }*/
    return null;
  }

  @action
  List<TrailsModel> getTrailsByCategory(int category) {
    if (trails != null && trails.isNotEmpty) {
      return trails.where((trail) => trail.category == category).toList();
    }
    return null;
  }
}
