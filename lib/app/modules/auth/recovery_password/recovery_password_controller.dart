import 'package:ems/app/repositories/firebase/firebase_user_instance.dart';
import 'package:ems/app/repositories/firebase/firebase_user_repository.dart';
import 'package:ems/app/shared/utils/i18n/i18n_config.dart';
import 'package:ems/app/shared/utils/validators/default_validator.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'recovery_password_controller.g.dart';

enum RecoveryPasswordStatus { IDLE, LOADING, DONE, ERROR }

class RecoveryPasswordController = _RecoveryPasswordBase
    with _$RecoveryPasswordController;

abstract class _RecoveryPasswordBase with Store {
  var formKey;
  FirebaseUserRepository _userRepository = FirebaseUserInstance.repository;

  @observable
  RecoveryPasswordStatus recoveryPasswordStatus = RecoveryPasswordStatus.IDLE;

  @observable
  String email = '';

  @observable
  String messageStatus = '';

  @action
  void onChangeEmail(String value) {
    email = value.trim();
  }

  @computed
  bool get emailValidated {
    if (DefaultValidator.isEmail(email) == null) return true;
    return false;
  }

  @action
  Future<void> recoveryPassword() async {
    try {
      final _form = formKey.currentState;
      if (_form.validate()) {
        recoveryPasswordStatus = RecoveryPasswordStatus.LOADING;
        await _userRepository.recoveryPassword(email: email);
        messageStatus = i18nDefault.recoverySentEmailMessage.i18n;
        recoveryPasswordStatus = RecoveryPasswordStatus.DONE;
      }
    } on PlatformException catch (e) {
      messageStatus = e.message;
      recoveryPasswordStatus = RecoveryPasswordStatus.ERROR;
    }
  }
}
