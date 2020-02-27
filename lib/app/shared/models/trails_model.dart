import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ems/app/shared/models/trail_model.dart';
import 'package:flutter/foundation.dart';

class TrailsModel {
  final int id;
  final int category;
  final String title;
  final List<TrailModel> trails;

  TrailsModel({
    @required this.id,
    @required this.category,
    @required this.title,
    @required this.trails,
  });

  factory TrailsModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return TrailsModel(
      id: data['id'],
      title: data['title'],
      category: data['category'],
      trails: data['trails']
          .map<TrailModel>((trail) => TrailModel.fromJson(trail))
          .toList(),
    );
  }
}
