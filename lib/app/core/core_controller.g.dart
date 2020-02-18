// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'core_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CoreController on _CoreBase, Store {
  final _$currentUserAtom = Atom(name: '_CoreBase.currentUser');

  @override
  UserModel get currentUser {
    _$currentUserAtom.context.enforceReadPolicy(_$currentUserAtom);
    _$currentUserAtom.reportObserved();
    return super.currentUser;
  }

  @override
  set currentUser(UserModel value) {
    _$currentUserAtom.context.conditionallyRunInAction(() {
      super.currentUser = value;
      _$currentUserAtom.reportChanged();
    }, _$currentUserAtom, name: '${_$currentUserAtom.name}_set');
  }

  final _$userLoadStatusAtom = Atom(name: '_CoreBase.userLoadStatus');

  @override
  UserLoadStatus get userLoadStatus {
    _$userLoadStatusAtom.context.enforceReadPolicy(_$userLoadStatusAtom);
    _$userLoadStatusAtom.reportObserved();
    return super.userLoadStatus;
  }

  @override
  set userLoadStatus(UserLoadStatus value) {
    _$userLoadStatusAtom.context.conditionallyRunInAction(() {
      super.userLoadStatus = value;
      _$userLoadStatusAtom.reportChanged();
    }, _$userLoadStatusAtom, name: '${_$userLoadStatusAtom.name}_set');
  }

  final _$messageStatusAtom = Atom(name: '_CoreBase.messageStatus');

  @override
  String get messageStatus {
    _$messageStatusAtom.context.enforceReadPolicy(_$messageStatusAtom);
    _$messageStatusAtom.reportObserved();
    return super.messageStatus;
  }

  @override
  set messageStatus(String value) {
    _$messageStatusAtom.context.conditionallyRunInAction(() {
      super.messageStatus = value;
      _$messageStatusAtom.reportChanged();
    }, _$messageStatusAtom, name: '${_$messageStatusAtom.name}_set');
  }

  final _$loadCurrentUserAsyncAction = AsyncAction('loadCurrentUser');

  @override
  Future<Null> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  final _$logoutCurrentUserAsyncAction = AsyncAction('logoutCurrentUser');

  @override
  Future<Null> logoutCurrentUser() {
    return _$logoutCurrentUserAsyncAction.run(() => super.logoutCurrentUser());
  }

  @override
  String toString() {
    final string =
        'currentUser: ${currentUser.toString()},userLoadStatus: ${userLoadStatus.toString()},messageStatus: ${messageStatus.toString()}';
    return '{$string}';
  }
}
