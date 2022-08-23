import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rehnuma/models/salah_model.dart';

class SalahList {
  List<SalahModel>? salahs;
  Timestamp? dateTime;
  String? date;
  String? uid;
  String? docId;

  SalahList(
      {this.salahs,
      this.date,
      this.dateTime,
      this.uid,
      this.docId});

  factory SalahList.fromJson(DocumentSnapshot json) {
    return SalahList(
        uid: json['uid'],
        dateTime: json["dateTime"],
        date: json['date'],
        salahs: List<SalahModel>.from(
            json["salahs"].map((x) => SalahModel.fromJson(x))),
        docId: json.id);
  }

  Map<String, dynamic> toJson() => {
        "salahs": List<dynamic>.from(salahs!.map((x) => x.toJson())),
        'uid': uid,
        'dateTime': dateTime,
        'date': date,
      };
}
