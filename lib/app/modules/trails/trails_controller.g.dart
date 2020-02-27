// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trails_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TrailsController on _TrailsBase, Store {
  final _$trailsStatusAtom = Atom(name: '_TrailsBase.trailsStatus');

  @override
  TrailsStatus get trailsStatus {
    _$trailsStatusAtom.context.enforceReadPolicy(_$trailsStatusAtom);
    _$trailsStatusAtom.reportObserved();
    return super.trailsStatus;
  }

  @override
  set trailsStatus(TrailsStatus value) {
    _$trailsStatusAtom.context.conditionallyRunInAction(() {
      super.trailsStatus = value;
      _$trailsStatusAtom.reportChanged();
    }, _$trailsStatusAtom, name: '${_$trailsStatusAtom.name}_set');
  }

  final _$trailsAtom = Atom(name: '_TrailsBase.trails');

  @override
  List<TrailsModel> get trails {
    _$trailsAtom.context.enforceReadPolicy(_$trailsAtom);
    _$trailsAtom.reportObserved();
    return super.trails;
  }

  @override
  set trails(List<TrailsModel> value) {
    _$trailsAtom.context.conditionallyRunInAction(() {
      super.trails = value;
      _$trailsAtom.reportChanged();
    }, _$trailsAtom, name: '${_$trailsAtom.name}_set');
  }

  final _$loadTrailsAsyncAction = AsyncAction('loadTrails');

  @override
  Future<Null> loadTrails() {
    return _$loadTrailsAsyncAction.run(() => super.loadTrails());
  }

  final _$_TrailsBaseActionController = ActionController(name: '_TrailsBase');

  @override
  List<TrailsModel> getTrailsByCategory(int category) {
    final _$actionInfo = _$_TrailsBaseActionController.startAction();
    try {
      return super.getTrailsByCategory(category);
    } finally {
      _$_TrailsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'trailsStatus: ${trailsStatus.toString()},trails: ${trails.toString()}';
    return '{$string}';
  }
}
