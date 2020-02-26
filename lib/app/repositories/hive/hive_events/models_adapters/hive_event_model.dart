import 'package:ems/app/shared/models/event_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'hive_event_model.g.dart';

@HiveType(typeId: 1)
class HiveEventModel implements EventModel {
  @HiveField(0)
  String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String body;

  @HiveField(3)
  DateTime date;

  @HiveField(4)
  String description;

  @HiveField(5)
  String image;

  HiveEventModel({
    @required this.id,
    @required this.title,
    @required this.body,
    @required this.date,
    @required this.description,
    @required this.image,
  });
}
