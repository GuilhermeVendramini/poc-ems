// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'module_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ModuleController on _ModuleBase, Store {
  final _$moduleAtom = Atom(name: '_ModuleBase.module');

  @override
  ModuleModel get module {
    _$moduleAtom.context.enforceReadPolicy(_$moduleAtom);
    _$moduleAtom.reportObserved();
    return super.module;
  }

  @override
  set module(ModuleModel value) {
    _$moduleAtom.context.conditionallyRunInAction(() {
      super.module = value;
      _$moduleAtom.reportChanged();
    }, _$moduleAtom, name: '${_$moduleAtom.name}_set');
  }

  final _$moduleStatusAtom = Atom(name: '_ModuleBase.moduleStatus');

  @override
  ModuleStatus get moduleStatus {
    _$moduleStatusAtom.context.enforceReadPolicy(_$moduleStatusAtom);
    _$moduleStatusAtom.reportObserved();
    return super.moduleStatus;
  }

  @override
  set moduleStatus(ModuleStatus value) {
    _$moduleStatusAtom.context.conditionallyRunInAction(() {
      super.moduleStatus = value;
      _$moduleStatusAtom.reportChanged();
    }, _$moduleStatusAtom, name: '${_$moduleStatusAtom.name}_set');
  }

  final _$loadModuleByIdAsyncAction = AsyncAction('loadModuleById');

  @override
  Future<Null> loadModuleById(int id) {
    return _$loadModuleByIdAsyncAction.run(() => super.loadModuleById(id));
  }

  @override
  String toString() {
    final string =
        'module: ${module.toString()},moduleStatus: ${moduleStatus.toString()}';
    return '{$string}';
  }
}
