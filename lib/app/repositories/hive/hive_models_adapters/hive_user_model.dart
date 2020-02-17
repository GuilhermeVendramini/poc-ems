import 'package:ems/app/shared/models/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_user_model.g.dart';

@HiveType(typeId: 0)
class HiveUserModel implements UserModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String email;

  @HiveField(2)
  String name;

  HiveUserModel({
    @required this.id,
    @required this.name,
    @required this.email,
  });
}
