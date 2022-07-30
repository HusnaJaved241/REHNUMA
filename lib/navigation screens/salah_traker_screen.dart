import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/calendar.dart';
import 'package:rehnuma/screens/home_screen.dart';
import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';

class SalahTrackerScreen extends StatefulWidget {
  SalahTrackerScreen({Key? key}) : super(key: key);

  @override
  State<SalahTrackerScreen> createState() => _SalahTrackerScreenState();
}

class _SalahTrackerScreenState extends State<SalahTrackerScreen> {
  FocusNode focusNode = FocusNode();
  List namazChecklist = [
    {
      "value": false,
      "title": "Fajr",
      "shukr": "",
    },
    {
      "value": false,
      "title": "Zuhr",
      "shukr": "",
    },
    {
      "value": false,
      "title": "Asar",
      "shukr": "",
    },
    {
      "value": false,
      "title": "Maghrib",
      "shukr": "",
    },
    {
      "value": false,
      "title": "Isha",
      "shukr": "",
    },
  ];

  bool isChecked = false;

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
          actions: [
            SearchBar(
              focusNode: focusNode,
            ),
          ],
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
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Background.jpg'),
                fit: BoxFit.cover),
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
                  Calendar(),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 5.0),
                      // height: 150.0,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: List.generate(
                          namazChecklist.length,
                          (index) => ListTile(
                            visualDensity:
                                VisualDensity(horizontal: 0, vertical: -4),
                            leading: Text(
                              namazChecklist[index]['title'],
                              style: kQuestionDescStyle,
                            ),
                            title: namazChecklist[index]["value"]
                                ? Text(
                                    'الحمد لله',
                                    textAlign: TextAlign.center,
                                    style: kQuestionDescStyle,
                                  )
                                : Text(''),
                            trailing: Checkbox(
                              checkColor: Color(0xFFAF1106),
                              fillColor:
                                  MaterialStateProperty.resolveWith(getColor),
                              focusColor: Colors.transparent,
                              value: namazChecklist[index]["value"],
                              onChanged: (bool? val) {
                                setState(() {
                                  namazChecklist[index]["value"] = val!;
                                });
                              },
                            ),
                          ),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
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
