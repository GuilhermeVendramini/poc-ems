import 'package:ems/app/repositories/hive/hive_instance.dart';
import 'package:ems/app/repositories/hive/hive_modules/models_adapters/hive_module_model.dart';
import 'package:ems/app/shared/models/module_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

class HiveModulesRepository {
  Box<Map> _modulesBox;

  Future<Null> loadModulesBox() async {
    if (_modulesBox == null) {
      try {
        await HiveInstance.initHive();
        Hive.registerAdapter(HiveModuleModelAdapter());
        _modulesBox = await Hive.openBox<Map>('modulesBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveModules({
    @required List<ModuleModel> modules,
    Duration cache = const Duration(days: 1),
  }) async {
    await loadModulesBox();
    modules.forEach((module) {
      HiveModuleModel _hiveModule = HiveModuleModel(
        title: module.title,
        id: module.id,
        image: module.image,
        body: module.body,
        score: module.score,
        video: module.video,
        enabled: module.enabled,
      );
      _modulesBox.put(
        module.id,
        {'data': _hiveModule, 'cache_expire': DateTime.now().add(cache)},
      );
    });

    return;
  }

  Future<Null> deleteModuleById(int id) async {
    await loadModulesBox();
    await _modulesBox.delete(id);
    return;
  }

  Future<bool> expiredCache(List<int> ids) async {
    await loadModulesBox();
    if (_modulesBox.isNotEmpty) {
      for (var id in ids) {
        var _module = _modulesBox.get(id);

        if (_module == null) {
          return true;
        }

        DateTime cache = _modulesBox.get(id)['cache_expire'];
        if (cache.isBefore(DateTime.now())) {
          return true;
        }
      }
      return false;
    }
    return true;
  }

  Future<List<ModuleModel>> getModulesByIds(List<int> ids) async {
    await loadModulesBox();
    if (_modulesBox.isNotEmpty) {
      List<dynamic> _hiveModules =
          ids.map((id) => _modulesBox.get(id)['data']).toList();
      List<ModuleModel> _modules = _hiveModules
          .map<ModuleModel>((module) => ModuleModel(
                id: module.id,
                image: module.image,
                body: module.body,
                title: module.title,
                video: module.video,
                score: module.score,
                enabled: module.enabled,
              ))
          .toList();
      return _modules;
    }
    return null;
  }

  Future<ModuleModel> getModuleById(int id) async {
    await loadModulesBox();
    if (_modulesBox.isNotEmpty) {
      ModuleModel _module = _modulesBox.get(id)['data'];

      return _module;
    }
    return null;
  }
}
