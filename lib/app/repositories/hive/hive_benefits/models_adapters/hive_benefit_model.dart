import 'package:ems/app/shared/models/benefit_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_benefit_model.g.dart';

@HiveType(typeId: 5)
class HiveBenefitModel implements BenefitModel {
  @HiveField(0)
  int id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  String image;

  @HiveField(4)
  String code;

  @HiveField(5)
  int score;

  @HiveField(6)
  int status;

  HiveBenefitModel({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.image,
    @required this.code,
    @required this.status,
    @required this.score,
  });
}
