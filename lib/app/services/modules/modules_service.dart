import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/repositories/firestore/firestore_modules_repository.dart';
import 'package:ems/app/repositories/hive/hive_modules/hive_modules_instance.dart';
import 'package:ems/app/repositories/hive/hive_modules/hive_modules_repository.dart';
import 'package:ems/app/shared/models/module_model.dart';

class ModulesService {
  final FirestoreModulesRepository _modulesRepository =
      FirestoreModulesRepository();

  final HiveModulesRepository _hiveModulesRepository =
      HiveModulesInstance.repository;

  Future<List<ModuleModel>> getCachedModules(List<int> ids) async {
    List<ModuleModel> _modules;
    _modules = await _hiveModulesRepository.getModulesByIds(ids);

    if (_modules != null && _modules.length > 0) {
      _modules.sort((a, b) => (b.enabled ? 1 : 0) - (a.enabled ? 1 : 0));
      return _modules;
    }

    return null;
  }

  Future<List<ModuleModel>> getModulesByIds(List<int> ids) async {
    List<ModuleModel> _modules;

    try {
      bool expiredCache = await _hiveModulesRepository.expiredCache(ids);

      if (!expiredCache) {
        _modules = await getCachedModules(ids);
        return _modules;
      }

      QuerySnapshot _result = await _modulesRepository.loadModulesByIds(ids);
      List<DocumentSnapshot> _documents = _result.documents;

      if (_documents.isNotEmpty) {
        _modules =
            _documents.map((doc) => ModuleModel.fromFirestore(doc)).toList();
        _modules.sort((a, b) => (b.enabled ? 1 : 0) - (a.enabled ? 1 : 0));
        _hiveModulesRepository.saveModules(modules: _modules);

        return _modules;
      }
      return null;
    } catch (e) {
      print('Class ModulesService - getModules: $e');
      _modules = await getCachedModules(ids);
      return _modules;
    }
  }
}
