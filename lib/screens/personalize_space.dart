import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/navigation%20screens/home.dart';
import 'package:rehnuma/screens/home_screen.dart';

class PersonalizeApp extends StatelessWidget {
  const PersonalizeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColor,
        body: Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('We\'re almost there!', style: kQuestionTextStyle),
                Text('Personalizing your space...', style: kQuestionDescStyle),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward_ios),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
