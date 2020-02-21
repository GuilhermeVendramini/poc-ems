import 'package:ems/app/repositories/hive/hive_user/hive_user_repository.dart';

class HiveUserInstance {
  HiveUserInstance._();

  static final HiveUserRepository repository = HiveUserRepository();
}
