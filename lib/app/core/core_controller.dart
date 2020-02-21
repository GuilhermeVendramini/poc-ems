import 'package:ems/app/repositories/firebase/firebase_user_instance.dart';
import 'package:ems/app/repositories/firebase/firebase_user_repository.dart';
import 'package:ems/app/repositories/hive/hive_user/hive_user_instance.dart';
import 'package:ems/app/repositories/hive/hive_user/hive_user_repository.dart';
import 'package:ems/app/shared/models/user_model.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'core_controller.g.dart';

enum UserLoadStatus { IDLE, LOADING, ERROR, DONE }

class CoreController = _CoreBase with _$CoreController;

abstract class _CoreBase with Store {
  @observable
  UserModel currentUser;

  @observable
  UserLoadStatus userLoadStatus = UserLoadStatus.IDLE;

  @observable
  String messageStatus = '';

  FirebaseUserRepository _userRepository = FirebaseUserInstance.repository;
  HiveUserRepository _hiveUserRepository = HiveUserInstance.repository;

  @action
  Future<Null> loadCurrentUser() async {
    if (currentUser == null) {
      try {
        userLoadStatus = UserLoadStatus.LOADING;
        currentUser = await _hiveUserRepository.getCurrentUser();
        userLoadStatus = UserLoadStatus.DONE;
      } on PlatformException catch (e) {
        messageStatus = e.message;
        userLoadStatus = UserLoadStatus.ERROR;
      }
    }
    return;
  }

  @action
  Future<Null> logoutCurrentUser() async {
    if (currentUser != null) {
      try {
        await _userRepository.logoutUser();
        await _hiveUserRepository.deleteCurrentUser();
        currentUser = null;
      } catch (e) {
        throw e;
      }
    }
    return;
  }
}
