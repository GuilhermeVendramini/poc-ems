// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_initial_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoreInitialController on _CoreInitialBase, Store {
  final _$eventsAtom = Atom(name: '_CoreInitialBase.events');

  @override
  List<EventModel> get events {
    _$eventsAtom.context.enforceReadPolicy(_$eventsAtom);
    _$eventsAtom.reportObserved();
    return super.events;
  }

  @override
  set events(List<EventModel> value) {
    _$eventsAtom.context.conditionallyRunInAction(() {
      super.events = value;
      _$eventsAtom.reportChanged();
    }, _$eventsAtom, name: '${_$eventsAtom.name}_set');
  }

  final _$eventsStatusAtom = Atom(name: '_CoreInitialBase.eventsStatus');

  @override
  EventsStatus get eventsStatus {
    _$eventsStatusAtom.context.enforceReadPolicy(_$eventsStatusAtom);
    _$eventsStatusAtom.reportObserved();
    return super.eventsStatus;
  }

  @override
  set eventsStatus(EventsStatus value) {
    _$eventsStatusAtom.context.conditionallyRunInAction(() {
      super.eventsStatus = value;
      _$eventsStatusAtom.reportChanged();
    }, _$eventsStatusAtom, name: '${_$eventsStatusAtom.name}_set');
  }

  final _$loadEventsAsyncAction = AsyncAction('loadEvents');

  @override
  Future<Null> loadEvents() {
    return _$loadEventsAsyncAction.run(() => super.loadEvents());
  }

  @override
  String toString() {
    final string =
        'events: ${events.toString()},eventsStatus: ${eventsStatus.toString()}';
    return '{$string}';
  }
}
