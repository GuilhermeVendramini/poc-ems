// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$LoginController on _LoginBase, Store {
  Computed<bool> _$emailPasswordValidatedComputed;

  @override
  bool get emailPasswordValidated => (_$emailPasswordValidatedComputed ??=
          Computed<bool>(() => super.emailPasswordValidated))
      .value;

  final _$signInUserStatusAtom = Atom(name: '_LoginBase.signInUserStatus');

  @override
  SignInUserStatus get signInUserStatus {
    _$signInUserStatusAtom.context.enforceReadPolicy(_$signInUserStatusAtom);
    _$signInUserStatusAtom.reportObserved();
    return super.signInUserStatus;
  }

  @override
  set signInUserStatus(SignInUserStatus value) {
    _$signInUserStatusAtom.context.conditionallyRunInAction(() {
      super.signInUserStatus = value;
      _$signInUserStatusAtom.reportChanged();
    }, _$signInUserStatusAtom, name: '${_$signInUserStatusAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_LoginBase.email');

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

  final _$passwordAtom = Atom(name: '_LoginBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$messageStatusAtom = Atom(name: '_LoginBase.messageStatus');

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

  final _$_LoginBaseActionController = ActionController(name: '_LoginBase');

  @override
  void onChangeEmail(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.onChangeEmail(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangePassword(String value) {
    final _$actionInfo = _$_LoginBaseActionController.startAction();
    try {
      return super.onChangePassword(value);
    } finally {
      _$_LoginBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'signInUserStatus: ${signInUserStatus.toString()},email: ${email.toString()},password: ${password.toString()},messageStatus: ${messageStatus.toString()},emailPasswordValidated: ${emailPasswordValidated.toString()}';
    return '{$string}';
  }
}
