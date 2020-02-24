import 'package:ems/app/repositories/hive/hive_user/models_adapters/hive_user_model.dart';
import 'package:ems/app/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

class HiveUserRepository {
  Box<HiveUserModel> _currentUserBox;

  Future<Null> loadCurrentUserBox() async {
    if (_currentUserBox == null) {
      try {
        var dir = await getApplicationDocumentsDirectory();
        Hive.init(dir.path);
        Hive.registerAdapter(HiveUserModelAdapter());
        _currentUserBox = await Hive.openBox<HiveUserModel>('currentUserBox');
      } catch (e) {
        throw e;
      }
    }
    return;
  }

  Future<Null> saveCurrentUser({@required UserModel user}) async {
    await loadCurrentUserBox();
    _currentUserBox.put(
      'currentUser',
      HiveUserModel(
        id: user.id,
        name: user.name,
        email: user.email,
        image: user.image,
      ),
    );
    return;
  }

  Future<Null> deleteCurrentUser() async {
    await loadCurrentUserBox();
    await _currentUserBox.delete('currentUser');
    return;
  }

  Future<UserModel> getCurrentUser() async {
    await loadCurrentUserBox();
    if (_currentUserBox.isNotEmpty) {
      UserModel currentUser = _currentUserBox.get('currentUser');
      return currentUser;
    }
    return null;
  }
}
