import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/practice_expansion.dart';
import 'package:rehnuma/screens/signin_screen.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:rehnuma/screens/splash_screen.dart';
import 'package:rehnuma/screens/today_performa_screen.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'navigation screens/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User? result = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'SukarBlack',
      ),
      getPages: [
        GetPage(name: '/', page: () => HomeScreen()),
        GetPage(name: "/register", page: () => SignupScreen()),
        GetPage(name: "/login", page: () => SignInScreen()),
        GetPage(name: "/splash", page: () => SplashScreen()),
      ],
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
    );
  }
}
