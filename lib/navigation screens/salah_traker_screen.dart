import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/calendar.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';
import 'package:rehnuma/screens/home_screen.dart';
import '../constants.dart';

class SalahTrackerScreen extends StatefulWidget {
  SalahTrackerScreen({Key? key}) : super(key: key);

  @override
  State<SalahTrackerScreen> createState() => _SalahTrackerScreenState();
}

class _SalahTrackerScreenState extends State<SalahTrackerScreen> {
  bool isChecked = false;
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return appColor;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          title: Text(
            'Salah Tracker',
            style: (kQuestionDescStyle),
          ),
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(
                  vertical: 10.0,
                ),
                // padding: const EdgeInsets.symmetric(horizontal: 20.0),
                width: MediaQuery.of(context).size.width,
                height: 170.0,
                child: Image.asset(
                  'assets/images/prayer1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Calendar(),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5.0),
                height: 150.0,
                child: ListView(
                  children: [
                    customTile('Fajr'),
                    divider(),
                    customTile('Zuhr'),
                    divider(),
                    customTile('Asar'),
                    divider(),
                    customTile('Maghrib'),
                    divider(),
                    customTile('Isha'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget customTile(String prayer) {
    return ListTile(
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      leading: Text(
        prayer,
        style: kQuestionDescStyle,
      ),
      title: Text(
        'الحمد لله',
        textAlign: TextAlign.center,
        style: kQuestionDescStyle,
      ),
      trailing: Checkbox(
        checkColor: Colors.white,
        fillColor: MaterialStateProperty.resolveWith(getColor),
        value: isChecked,
        onChanged: (bool? value) {
          setState(() {
            isChecked = value!;
          });
        },
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
