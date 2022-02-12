import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class PersonalizeApp extends StatelessWidget {
  const PersonalizeApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffc0ffa6),
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
      ),
    );
  }
}