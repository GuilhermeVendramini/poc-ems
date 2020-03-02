import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_trail_model.g.dart';

@HiveType(typeId: 2)
class HiveTrailModel implements TrailModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  int score;

  @HiveField(2)
  int status;

  @HiveField(3)
  String image;

  @HiveField(4)
  String title;

  @HiveField(5)
  List<int> modules;

  @HiveField(6)
  String category;

  HiveTrailModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.status,
    @required this.score,
    @required this.modules,
    @required this.category,
  });
}
