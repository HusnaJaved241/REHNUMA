import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class QuestionModel {
  QuestionModel({
    required this.question,
    required this.answer,
  });

  String question;
  dynamic answer;

  factory QuestionModel.fromJson(dynamic json) {
    return QuestionModel(
      question: json["question"],
      answer: json["answer"],
        );
  }

  Map<String, dynamic> toJson() =>
      {"question": question, "answer": answer,};
}
