import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rehnuma/models/questions_model.dart';

class PerformaModel {
  PerformaModel({
    this.emotion,
    this.feeling,
    this.noteToYourSelf,
    this.questions,
    this.sliderQuestions,
    this.quickCheckList,
    this.uid,
    this.dateTime,
    this.date,
    this.docId,
  });

  String? emotion;
  String? feeling;
  List<QuestionModel>? questions;
  List<QuestionModel>? sliderQuestions;
  List<QuestionModel>? quickCheckList;
  String? noteToYourSelf;
  Timestamp? dateTime;
  String? date;
  String? uid;
  String? docId;
  factory PerformaModel.fromJson(DocumentSnapshot json) {
    return PerformaModel(
        emotion: json["emotion"],
        feeling: json["feeling"],
        uid: json['uid'],
        dateTime: json["dateTime"],
        noteToYourSelf: json["noteToYourSelf"],
        date: json['date'],
        questions: List<QuestionModel>.from(json["questions"].map((x)=>QuestionModel.fromJson(x))),
        sliderQuestions: List<QuestionModel>.from(json["sliderQuestions"].map((x) => QuestionModel.fromJson(x))),
        quickCheckList: List<QuestionModel>.from(json["quickCheckList"].map((x) => QuestionModel.fromJson(x))),
        docId: json.id);
  }

  Map<String, dynamic> toJson() => {
        "emotion": emotion,
        "feeling": feeling,
        "noteToYourSelf": noteToYourSelf,
        "questions": List<dynamic>.from(questions!.map((x) => x.toJson())),
        'sliderQuestions': List<dynamic>.from(sliderQuestions!.map((x) => x.toJson())),
        'uid': uid,
        'dateTime':dateTime,
        'date':date,
        'quickCheckList': List<dynamic>.from(quickCheckList!.map((x) => x.toJson()))
      };
}
