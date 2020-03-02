// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrailController on _TrailBase, Store {
  final _$trailAtom = Atom(name: '_TrailBase.trail');

  @override
  TrailModel get trail {
    _$trailAtom.context.enforceReadPolicy(_$trailAtom);
    _$trailAtom.reportObserved();
    return super.trail;
  }

  @override
  set trail(TrailModel value) {
    _$trailAtom.context.conditionallyRunInAction(() {
      super.trail = value;
      _$trailAtom.reportChanged();
    }, _$trailAtom, name: '${_$trailAtom.name}_set');
  }

  final _$modulesAtom = Atom(name: '_TrailBase.modules');

  @override
  List<ModuleModel> get modules {
    _$modulesAtom.context.enforceReadPolicy(_$modulesAtom);
    _$modulesAtom.reportObserved();
    return super.modules;
  }

  @override
  set modules(List<ModuleModel> value) {
    _$modulesAtom.context.conditionallyRunInAction(() {
      super.modules = value;
      _$modulesAtom.reportChanged();
    }, _$modulesAtom, name: '${_$modulesAtom.name}_set');
  }

  final _$trailsCategoryAtom = Atom(name: '_TrailBase.trailsCategory');

  @override
  String get trailsCategory {
    _$trailsCategoryAtom.context.enforceReadPolicy(_$trailsCategoryAtom);
    _$trailsCategoryAtom.reportObserved();
    return super.trailsCategory;
  }

  @override
  set trailsCategory(String value) {
    _$trailsCategoryAtom.context.conditionallyRunInAction(() {
      super.trailsCategory = value;
      _$trailsCategoryAtom.reportChanged();
    }, _$trailsCategoryAtom, name: '${_$trailsCategoryAtom.name}_set');
  }

  final _$trailStatusAtom = Atom(name: '_TrailBase.trailStatus');

  @override
  TrailStatus get trailStatus {
    _$trailStatusAtom.context.enforceReadPolicy(_$trailStatusAtom);
    _$trailStatusAtom.reportObserved();
    return super.trailStatus;
  }

  @override
  set trailStatus(TrailStatus value) {
    _$trailStatusAtom.context.conditionallyRunInAction(() {
      super.trailStatus = value;
      _$trailStatusAtom.reportChanged();
    }, _$trailStatusAtom, name: '${_$trailStatusAtom.name}_set');
  }

  final _$modulesStatusAtom = Atom(name: '_TrailBase.modulesStatus');

  @override
  ModulesStatus get modulesStatus {
    _$modulesStatusAtom.context.enforceReadPolicy(_$modulesStatusAtom);
    _$modulesStatusAtom.reportObserved();
    return super.modulesStatus;
  }

  @override
  set modulesStatus(ModulesStatus value) {
    _$modulesStatusAtom.context.conditionallyRunInAction(() {
      super.modulesStatus = value;
      _$modulesStatusAtom.reportChanged();
    }, _$modulesStatusAtom, name: '${_$modulesStatusAtom.name}_set');
  }

  final _$loadTrailByIdAsyncAction = AsyncAction('loadTrailById');

  @override
  Future<Null> loadTrailById({@required int id, @required int trailId}) {
    return _$loadTrailByIdAsyncAction
        .run(() => super.loadTrailById(id: id, trailId: trailId));
  }

  final _$loadModulesByIdsAsyncAction = AsyncAction('loadModulesByIds');

  @override
  Future<Null> loadModulesByIds(List<int> ids) {
    return _$loadModulesByIdsAsyncAction.run(() => super.loadModulesByIds(ids));
  }

  @override
  String toString() {
    final string =
        'trail: ${trail.toString()},modules: ${modules.toString()},trailsCategory: ${trailsCategory.toString()},trailStatus: ${trailStatus.toString()},modulesStatus: ${modulesStatus.toString()}';
    return '{$string}';
  }
}
