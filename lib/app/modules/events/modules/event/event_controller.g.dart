// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventController on _EventBase, Store {
  final _$eventAtom = Atom(name: '_EventBase.event');

  @override
  EventModel get event {
    _$eventAtom.context.enforceReadPolicy(_$eventAtom);
    _$eventAtom.reportObserved();
    return super.event;
  }

  @override
  set event(EventModel value) {
    _$eventAtom.context.conditionallyRunInAction(() {
      super.event = value;
      _$eventAtom.reportChanged();
    }, _$eventAtom, name: '${_$eventAtom.name}_set');
  }

  final _$eventStatusAtom = Atom(name: '_EventBase.eventStatus');

  @override
  EventStatus get eventStatus {
    _$eventStatusAtom.context.enforceReadPolicy(_$eventStatusAtom);
    _$eventStatusAtom.reportObserved();
    return super.eventStatus;
  }

  @override
  set eventStatus(EventStatus value) {
    _$eventStatusAtom.context.conditionallyRunInAction(() {
      super.eventStatus = value;
      _$eventStatusAtom.reportChanged();
    }, _$eventStatusAtom, name: '${_$eventStatusAtom.name}_set');
  }

  final _$loadEventByIdAsyncAction = AsyncAction('loadEventById');

  @override
  Future<Null> loadEventById(int id) {
    return _$loadEventByIdAsyncAction.run(() => super.loadEventById(id));
  }

  @override
  String toString() {
    final string =
        'event: ${event.toString()},eventStatus: ${eventStatus.toString()}';
    return '{$string}';
  }
}
