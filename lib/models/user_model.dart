import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  UserModel({
    required this.name,
    required this.email,
    required this.gender,
    required this.goal,
    this.docId,
  });

  String name;
  String email;
  String gender;
  String goal;
  String? docId;

  factory UserModel.fromJson(DocumentSnapshot json) {
    print(json["name"]);
    return UserModel(
        name: json["name"],
        email: json["email"],
        gender: json["gender"],
        goal: json["goal"],
        docId: json.id);
  }

  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "gender": gender, "goal": goal};
}
