import 'package:ems/app/services/modules/modules_service.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:mobx/mobx.dart';

part 'module_controller.g.dart';

enum ModuleStatus { IDLE, LOADING, ERROR, DONE }

class ModuleController = _ModuleBase with _$ModuleController;

abstract class _ModuleBase with Store {
  @observable
  ModuleModel module;

  @observable
  ModuleStatus moduleStatus = ModuleStatus.IDLE;

  ModulesService _modulesService = ModulesService();

  @action
  Future<Null> loadModuleById(int id) async {
    try {
      moduleStatus = ModuleStatus.LOADING;
      List<ModuleModel> _modules = await _modulesService.getModulesByIds([id]);
      if (_modules != null && _modules.length > 0) {
        module = _modules.first;
      }
      moduleStatus = ModuleStatus.DONE;
    } catch (e) {
      moduleStatus = ModuleStatus.ERROR;
      print('Class EventController - loadEventById: $e');
    }
    return null;
  }
}
