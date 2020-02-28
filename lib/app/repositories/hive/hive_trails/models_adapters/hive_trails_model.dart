import 'package:ems/app/repositories/hive/hive_trails/models_adapters/hive_trail_model.dart';
import 'package:ems/app/shared/models/trails_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_trails_model.g.dart';

@HiveType(typeId: 3)
class HiveTrailsModel implements TrailsModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  int category;

  @HiveField(2)
  List<HiveTrailModel> trails;

  @HiveField(3)
  String title;

  HiveTrailsModel({
    @required this.id,
    @required this.title,
    @required this.trails,
    @required this.category,
  });
}
