import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class TrailModel {
  final int id;
  final String title;
  final int status;
  final int score;
  final String image;
  final List<int> modules;

  TrailModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.modules,
    @required this.score,
    @required this.status,
  });

  factory TrailModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return TrailModel(
      id: data['id'],
      title: data['title'],
      image: data['image'],
      modules: data['modules'],
      score: data['score'],
      status: data['status'],
    );
  }
}
