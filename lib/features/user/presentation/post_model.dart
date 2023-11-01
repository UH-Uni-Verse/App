import 'package:flutter/material.dart';
import 'user_model.dart';
import 'package:app/features/user/data/user_data.dart';
import 'package:app/features/class/class.dart';

class PostModel {
  final String id, title, summary, body, imageURL;
  final DateTime postTime;
  final int reacts, views;
  final UserModel author;

  const PostModel({
    required this.id,
    required this.title,
    required this.summary,
    required this.body,
    required this.imageURL,
    required this.author,
    required this.postTime,
    required this.reacts,
    required this.views,
  });

  //String get postTimeFormatted => DateFormat.yMMMMEEEEd().format(postTime);
}