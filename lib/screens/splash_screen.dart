import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/signin_screen.dart';
import 'package:rehnuma/screens/signup_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
        User? result = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      print("After 3 seconds");
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  result!=null ? HomeScreen():  SignInScreen()));
    }); 

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          'assets/images/16.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
