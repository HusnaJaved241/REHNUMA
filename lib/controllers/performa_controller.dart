import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehnuma/models/date_with_emotion.dart';
import 'package:rehnuma/models/performa_model.dart';

class PerformaController extends GetxController {
  var performaCollectionReference =
      FirebaseFirestore.instance.collection('performa');
  List<PerformaModel> performas = <PerformaModel>[].obs;
  var performaModel = PerformaModel().obs;

  List<DateEmotion> dates = <DateEmotion>[].obs;
  var isLoading = false.obs;

  Future uploadPerforma(PerformaModel performaModel) async {
    try {
      isLoading.value = true;
      await performaCollectionReference.add(performaModel.toJson());
      return "success";
    } catch (e) {
      return "Something went wrong";
    } finally {
      isLoading.value = false;
    }
  }

  Future getAllPerformas() async {
    try {
      isLoading.value = true;
      var val = await performaCollectionReference
          .where("dateTime", isGreaterThan: Timestamp.fromDate(getDate()))
      .where("uid",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (int i = 0; i < val.docs.length; i++) {
        PerformaModel performaModel = PerformaModel.fromJson(val.docs[i]);

        performas.add(performaModel);
        dates.add(
          DateEmotion(
              emotion: performaModel.emotion!, date: performaModel.date!),
        );
      }

      return "success";
    } catch (e) {
      print(e);
      return "Something went wrong";
    } finally {
      isLoading.value = false;
    }
  }

  Future getPerforma(String date) async {
    try {
      isLoading.value = true;
      var val = await performaCollectionReference
          .where("date", isEqualTo: date)
          .get();
      for (int i = 0; i < val.docs.length; i++) {
        performaModel.value = PerformaModel.fromJson(val.docs[i]);
      }
      return "success";
    } catch (e) {
      print(e);
      return "Something went wrong";
    } finally {
      isLoading.value = false;
    }
  }

  DateTime getDate() {
    return DateTime.now().add(Duration(days: -29));
  }
}
