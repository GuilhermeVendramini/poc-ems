// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recovery_password_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RecoveryPasswordController on _RecoveryPasswordBase, Store {
  Computed<bool> _$emailValidatedComputed;

  @override
  bool get emailValidated =>
      (_$emailValidatedComputed ??= Computed<bool>(() => super.emailValidated))
          .value;

  final _$recoveryPasswordStatusAtom =
      Atom(name: '_RecoveryPasswordBase.recoveryPasswordStatus');

  @override
  RecoveryPasswordStatus get recoveryPasswordStatus {
    _$recoveryPasswordStatusAtom.context
        .enforceReadPolicy(_$recoveryPasswordStatusAtom);
    _$recoveryPasswordStatusAtom.reportObserved();
    return super.recoveryPasswordStatus;
  }

  @override
  set recoveryPasswordStatus(RecoveryPasswordStatus value) {
    _$recoveryPasswordStatusAtom.context.conditionallyRunInAction(() {
      super.recoveryPasswordStatus = value;
      _$recoveryPasswordStatusAtom.reportChanged();
    }, _$recoveryPasswordStatusAtom,
        name: '${_$recoveryPasswordStatusAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_RecoveryPasswordBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$messageStatusAtom = Atom(name: '_RecoveryPasswordBase.messageStatus');

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

  final _$recoveryPasswordAsyncAction = AsyncAction('recoveryPassword');

  @override
  Future<void> recoveryPassword() {
    return _$recoveryPasswordAsyncAction.run(() => super.recoveryPassword());
  }

  final _$_RecoveryPasswordBaseActionController =
      ActionController(name: '_RecoveryPasswordBase');

  @override
  void onChangeEmail(String value) {
    final _$actionInfo = _$_RecoveryPasswordBaseActionController.startAction();
    try {
      return super.onChangeEmail(value);
    } finally {
      _$_RecoveryPasswordBaseActionController.endAction(_$actionInfo);
    }
  }
}
