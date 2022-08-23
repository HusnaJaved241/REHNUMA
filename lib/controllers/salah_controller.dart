import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rehnuma/models/date_salahs.dart';
import 'package:rehnuma/models/salah_list.dart';

import '../models/salah_model.dart';

class SalahController extends GetxController {
  var salahCollectionReference = FirebaseFirestore.instance.collection('salah');
  List<SalahList> salahList = <SalahList>[].obs;
  var selectedDate = DateTime.now().obs;

  List<DateSalahs> dateSalah = <DateSalahs>[].obs;
  var isLoading = false.obs;

  Future uploadSalah(SalahList salahList) async {
    try {
      isLoading.value = true;
      await salahCollectionReference.add(salahList.toJson());
      return "success";
    } catch (e) {
      return "Something went wrong";
    } finally {
      isLoading.value = false;
    }
  }

  Future changeDate(DateTime date) async {
    selectedDate.value = date;
    update();
  }

  //
  Future getAllSalahs() async {
    try {
      isLoading.value = true;
      salahList.clear();
      dateSalah.clear();
      var val = await salahCollectionReference
          .where("dateTime", isGreaterThan: Timestamp.fromDate(getDate()))
          .where("uid", isEqualTo: FirebaseAuth.instance.currentUser!.uid)
          .get();
      for (int i = 0; i < val.docs.length; i++) {
        SalahList salahDetail = SalahList.fromJson(val.docs[i]);

        salahList.add(salahDetail);
        dateSalah.add(
          DateSalahs(
              salahs: salahDetail.salahs!, date: salahDetail.date!),
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

  // Future getPerforma(String date) async {
  //   try {
  //     isLoading.value = true;
  //     var val = await performaCollectionReference
  //         .where("date", isEqualTo: date)
  //         .get();
  //     for (int i = 0; i < val.docs.length; i++) {
  //       performaModel.value = PerformaModel.fromJson(val.docs[i]);
  //     }
  //     return "success";
  //   } catch (e) {
  //     print(e);
  //     return "Something went wrong";
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }

  DateTime getDate() {
    return DateTime.now().add(Duration(days: -29));
  }
}
