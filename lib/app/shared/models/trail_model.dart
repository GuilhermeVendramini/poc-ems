import 'package:flutter/foundation.dart';

class TrailModel {
  final int id;
  final String title;
  final String category;
  final int status;
  final int score;
  final String image;
  final List<int> modules;

  TrailModel({
    @required this.id,
    @required this.title,
    @required this.category,
    @required this.image,
    @required this.modules,
    @required this.score,
    @required this.status,
  });

  factory TrailModel.fromJson(Map<dynamic, dynamic> data) {
    return TrailModel(
      id: data['id'],
      title: data['title'],
      category: data['category'],
      image: data['image'],
      modules: data['modules'].cast<int>(),
      score: data['score'],
      status: data['status'],
    );
  }
}
