import 'package:flutter/material.dart';
import 'package:rehnuma/screens/intro_screen.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:rehnuma/screens/story_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      fontFamily: 'SukarBlack',
      primaryColor: Color(0xffc0ffa6),
    ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 1,
        imageBackground: AssetImage('assets/images/12.jpg'),
        // navigateAfterSeconds: StoryPage(),
        navigateAfterSeconds: StoryPage(),
        useLoader: false,
      ),
    );
  }
}
