import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String name;
  final String email;

  UserModel({
    @required this.id,
    @required this.name,
    this.email,
  });
}
