import 'package:ems/app/shared/models/module_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_module_model.g.dart';

@HiveType(typeId: 4)
class HiveModuleModel implements ModuleModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  String image;

  @HiveField(4)
  int score;

  @HiveField(5)
  String video;

  @HiveField(6)
  bool enabled;

  HiveModuleModel({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.image,
    @required this.score,
    @required this.video,
    @required this.enabled,
  });
}
