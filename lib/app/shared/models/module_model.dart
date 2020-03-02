import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ModuleModel {
  final int id;
  final String title;
  final String image;
  final String video;
  final int score;
  final String body;
  final bool enabled;

  ModuleModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.video,
    @required this.score,
    @required this.body,
    @required this.enabled,
  });

  factory ModuleModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return ModuleModel(
      id: data['id'],
      title: data['title'],
      image: data['image'],
      body: data['body'],
      video: data['video'],
      score: data['score'],
      enabled: data['enabled'],
    );
  }
}
