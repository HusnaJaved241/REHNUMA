import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehnuma/controllers/salah_controller.dart';
import 'package:rehnuma/home_screen_widgets/calendar.dart';
import 'package:rehnuma/mixins.dart';
import 'package:rehnuma/models/date_salahs.dart';
import 'package:rehnuma/models/salah_list.dart';
import 'package:rehnuma/models/salah_model.dart';
import 'package:rehnuma/screens/home_screen.dart';
import '../constants.dart';
import 'dua_screen.dart';

class SalahTrackerScreen extends StatefulWidget {
  SalahTrackerScreen({Key? key}) : super(key: key);

  @override
  State<SalahTrackerScreen> createState() => _SalahTrackerScreenState();
}

class _SalahTrackerScreenState extends State<SalahTrackerScreen> with GetSnack {
  late SalahController salahController;
  List<SalahModel> salahs = [
    SalahModel(status: false, salahName: 'Fajr', shukar: ''),
    SalahModel(status: false, salahName: 'Zuhr', shukar: ''),
    SalahModel(status: false, salahName: 'Asar', shukar: ''),
    SalahModel(status: false, salahName: 'Maghrib', shukar: ''),
    SalahModel(status: false, salahName: 'Isha', shukar: ''),
  ];

  void getSalahs() async {
    dynamic success = await salahController.getAllSalahs();
    if (success != 'success') {
      showSnackBar(title: "Salahs", msg: "Couldn't load salah list");
    }
  }

  @override
  void dispose() {
    salahController.dispose();
    print("SDsd");
    super.dispose();
  }

  @override
  void initState() {
    salahController = Get.put(SalahController());
    getSalahs();
    super.initState();
  }

  FocusNode focusNode = FocusNode();

  bool isChecked = false;
  final _dateFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MMM');

  String getDateDay(DateTime dateTime) {
    dynamic date = _dateFormatter.format(dateTime);
    final month = _monthFormatter.format(dateTime);
    return '$date $month';
  }

  Future<dynamic> _addData(List<SalahModel> salahs) async {
    SalahList salahModel = SalahList(
        salahs: salahs,
        uid: FirebaseAuth.instance.currentUser!.uid,
        date: getDateDay(salahController.selectedDate.value),
        dateTime: Timestamp.fromDate(salahController.selectedDate.value));
    String success = await salahController.uploadSalah(salahModel);
    if (success == 'success') {
      getSalahs();
    }
  }

  dynamic getList(String first, List<DateSalahs> second) {
    for (int i = 0; i < second.length; i++) {
      if (first == second[i].date) {
        return second[i].salahs;
      }
    }
    return null;
  }

  String getDateString(DateTime dateTime) {
    return "${_dateFormatter.format(dateTime)} ${_monthFormatter.format(dateTime)}";
  }

  //for checkbox
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return appColor;
    }
    return Color.fromARGB(255, 11, 54, 90);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 27.0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
        ),
        body: Obx(() {
          if (salahController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            dynamic list = getList(
                getDateString(salahController.selectedDate.value),
                salahController.dateSalah);
            print(list);

            return Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(bgImage), fit: BoxFit.cover),
              ),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          'Salah Tracker',
                          style: kQuestionTextStyle,
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/Salah.jpg'),
                            fit: BoxFit.fill,
                          ),
                        ),
                        height: 190.0,
                        margin: const EdgeInsets.symmetric(
                          vertical: 10.0,
                        ),
                        // ),
                      ),
                      Calendar(
                        selectedDate: salahController.selectedDate.value,
                        onChanged: (DateTime date, List events) {
                          salahController.changeDate(date);
                        },
                      ),
                      (list != null ||
                              salahController.selectedDate.value.day ==
                                  DateTime.now().day)
                          ? Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              // height: 150.0,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: List.generate(
                                  list != null ? list.length : salahs.length,
                                  (index) => ListTile(
                                    visualDensity: VisualDensity(
                                        horizontal: 0, vertical: -4),
                                    leading: Text(
                                      list != null
                                          ? list[index].salahName.toString()
                                          : salahs[index].salahName.toString(),
                                      style: kQuestionDescStyle,
                                    ),
                                    title: (list != null
                                            ? list[index].status
                                            : salahs[index].status)
                                        ? Text(
                                            'الحمد لله',
                                            textAlign: TextAlign.center,
                                            style: kQuestionDescStyle,
                                          )
                                        : Text(''),
                                    trailing: Checkbox(
                                      checkColor: Color(0xFFAF1106),
                                      fillColor:
                                          MaterialStateProperty.resolveWith(
                                              getColor),
                                      focusColor: Colors.transparent,
                                      value: list != null
                                          ? list[index].status
                                          : salahs[index].status,
                                      onChanged: (bool? val) {
                                        if (list == null) {
                                          setState(() {
                                            if (list != null) {
                                              if (val == true) {
                                                list[index].shukar =
                                                    'الحمد لله';
                                              }
                                              list[index].status = val!;
                                            } else {
                                              if (val == true) {
                                                salahs[index].shukar =
                                                    'الحمد لله';
                                              }
                                              salahs[index].status = val!;
                                            }
                                          });
                                        }
                                      },
                                    ),
                                  ),
                                ),
                              ))
                          : Container(
                              height: 50,
                              child: Center(
                                child: Text(
                                  'No record added on this day',
                                  style: kBigWhiteTextStyle,
                                ),
                              ),
                            ),
                      if (salahController.selectedDate.value.day ==
                              DateTime.now().day &&
                          list == null)
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60.0,
                              vertical: 10.0,
                            ),
                            child: CustomTile(
                                text: 'Save',
                                newScreen: () {
                                  _addData(list != null ? list : salahs);
                                })),
                    ],
                  ),
                ),
              ),
            );
          }
        }),
      ),
    );
  }

  Widget divider() {
    return Divider(
      color: Colors.grey,
      thickness: 1.5,
    );
  }
}
