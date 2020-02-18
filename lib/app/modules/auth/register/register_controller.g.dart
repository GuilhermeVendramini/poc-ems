// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegisterController on _RegisterBase, Store {
  Computed<bool> _$emailPasswordValidatedComputed;

  @override
  bool get emailPasswordValidated => (_$emailPasswordValidatedComputed ??=
          Computed<bool>(() => super.emailPasswordValidated))
      .value;

  final _$registerUserStatusAtom =
      Atom(name: '_RegisterBase.registerUserStatus');

  @override
  RegisterUserStatus get registerUserStatus {
    _$registerUserStatusAtom.context
        .enforceReadPolicy(_$registerUserStatusAtom);
    _$registerUserStatusAtom.reportObserved();
    return super.registerUserStatus;
  }

  @override
  set registerUserStatus(RegisterUserStatus value) {
    _$registerUserStatusAtom.context.conditionallyRunInAction(() {
      super.registerUserStatus = value;
      _$registerUserStatusAtom.reportChanged();
    }, _$registerUserStatusAtom, name: '${_$registerUserStatusAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_RegisterBase.email');

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

  final _$passwordAtom = Atom(name: '_RegisterBase.password');

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

  final _$confirmPasswordAtom = Atom(name: '_RegisterBase.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$messageStatusAtom = Atom(name: '_RegisterBase.messageStatus');

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

  final _$_RegisterBaseActionController =
      ActionController(name: '_RegisterBase');

  @override
  void onChangeEmail(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.onChangeEmail(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangePassword(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.onChangePassword(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onChangeConfirmPassword(String value) {
    final _$actionInfo = _$_RegisterBaseActionController.startAction();
    try {
      return super.onChangeConfirmPassword(value);
    } finally {
      _$_RegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'registerUserStatus: ${registerUserStatus.toString()},email: ${email.toString()},password: ${password.toString()},confirmPassword: ${confirmPassword.toString()},messageStatus: ${messageStatus.toString()},emailPasswordValidated: ${emailPasswordValidated.toString()}';
    return '{$string}';
  }
}
