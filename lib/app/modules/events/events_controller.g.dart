// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'events_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EventsController on _EventsBase, Store {
  final _$eventsAtom = Atom(name: '_EventsBase.events');

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

  final _$filteredEventsAtom = Atom(name: '_EventsBase.filteredEvents');

  @override
  List<EventModel> get filteredEvents {
    _$filteredEventsAtom.context.enforceReadPolicy(_$filteredEventsAtom);
    _$filteredEventsAtom.reportObserved();
    return super.filteredEvents;
  }

  @override
  set filteredEvents(List<EventModel> value) {
    _$filteredEventsAtom.context.conditionallyRunInAction(() {
      super.filteredEvents = value;
      _$filteredEventsAtom.reportChanged();
    }, _$filteredEventsAtom, name: '${_$filteredEventsAtom.name}_set');
  }

  final _$eventsStatusAtom = Atom(name: '_EventsBase.eventsStatus');

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

  final _$eventsBlockTitleAtom = Atom(name: '_EventsBase.eventsBlockTitle');

  @override
  String get eventsBlockTitle {
    _$eventsBlockTitleAtom.context.enforceReadPolicy(_$eventsBlockTitleAtom);
    _$eventsBlockTitleAtom.reportObserved();
    return super.eventsBlockTitle;
  }

  @override
  set eventsBlockTitle(String value) {
    _$eventsBlockTitleAtom.context.conditionallyRunInAction(() {
      super.eventsBlockTitle = value;
      _$eventsBlockTitleAtom.reportChanged();
    }, _$eventsBlockTitleAtom, name: '${_$eventsBlockTitleAtom.name}_set');
  }

  final _$loadEventsAsyncAction = AsyncAction('loadEvents');

  @override
  Future<Null> loadEvents() {
    return _$loadEventsAsyncAction.run(() => super.loadEvents());
  }

  final _$_EventsBaseActionController = ActionController(name: '_EventsBase');

  @override
  void filterEvents({DateTime dateTime}) {
    final _$actionInfo = _$_EventsBaseActionController.startAction();
    try {
      return super.filterEvents(dateTime: dateTime);
    } finally {
      _$_EventsBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'events: ${events.toString()},filteredEvents: ${filteredEvents.toString()},eventsStatus: ${eventsStatus.toString()},eventsBlockTitle: ${eventsBlockTitle.toString()}';
    return '{$string}';
  }
}
