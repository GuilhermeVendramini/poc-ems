import 'package:flutter/foundation.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String image;

  UserModel({
    @required this.id,
    @required this.name,
    @required this.email,
    this.image = 'https://i.picsum.photos/id/0/200/200.jpg',
  });
}
