import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/practice_expansion.dart';
import 'package:rehnuma/screens/today_performa_screen.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:splashscreen/splashscreen.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
      User? result = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    theme: ThemeData(
      fontFamily: 'SukarBlack',
    ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(
        seconds: 1,
        imageBackground: AssetImage('assets/images/16.jpg'),
        navigateAfterSeconds: PracticeFirebase(),
        // navigateAfterSeconds: result!=null ? Home(uid: result.uid) :  SignupScreen(),
        useLoader: false,
      ),
    );
  }
}
