import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class BenefitModel {
  final int id;
  final String title;
  final int status;
  final int score;
  final String image;
  final String body;
  final String code;

  BenefitModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.score,
    @required this.status,
    @required this.body,
    @required this.code,
  });

  factory BenefitModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return BenefitModel(
      id: data['id'],
      title: data['title'],
      body: data['body'],
      image: data['image'],
      score: data['score'],
      status: data['status'],
      code: data['code'],
    );
  }
}
