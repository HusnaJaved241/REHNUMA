import 'package:feedback/feedback.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get_storage/get_storage.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/feedback_screen.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/practice_expansion.dart';
import 'package:rehnuma/screens/signin_screen.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:rehnuma/screens/splash_screen.dart';
import 'package:rehnuma/screens/story_screen.dart';
import 'package:rehnuma/screens/today_performa_screen.dart';
// ignore: import_of_legacy_library_into_null_safe

import 'navigation screens/home.dart';
import 'screens/about_us.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  User? result = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return BetterFeedback(
      theme: FeedbackThemeData(
        drawColors: [
          Colors.black,
          Colors.purple,
          Colors.red,
        ],
        activeFeedbackModeColor: appColor,
        background: Colors.purple.shade100,
      ),
      child: GetMaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', ''),
          Locale('ar', 'Arabic'),
        ],
        theme: ThemeData(
          fontFamily: 'SukarBlack',
          // primaryColor: appColor,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: appColor,
          ),
          appBarTheme: AppBarTheme(backgroundColor: appColor),
        ),
        getPages: [
          GetPage(name: '/', page: () => HomeScreen()),
          GetPage(name: "/register", page: () => SignupScreen()),
          GetPage(name: "/login", page: () => SignInScreen()),
          GetPage(name: "/splash", page: () => SplashScreen()),
          GetPage(name: "/aboutus", page: () => AboutUsScreen()),
          GetPage(name: "/feedback", page: () => FeedbackScreen()),
          GetPage(name: "/story", page: () => StoryPage()),
        ],
        debugShowCheckedModeBanner: false,
        initialRoute: '/splash',
      ),
    );
  }
}
