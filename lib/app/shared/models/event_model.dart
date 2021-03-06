import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class EventModel {
  final int id;
  final String title;
  final String image;
  final DateTime date;
  final String description;
  final String body;

  EventModel({
    @required this.id,
    @required this.title,
    @required this.image,
    @required this.date,
    @required this.description,
    @required this.body,
  });

  factory EventModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    Timestamp date = data['date'];

    return EventModel(
      id: data['id'],
      title: data['title'],
      image: data['image'],
      body: data['body'],
      description: data['description'],
      date: date.toDate(),
    );
  }
}
