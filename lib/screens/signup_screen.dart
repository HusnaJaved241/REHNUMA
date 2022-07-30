
import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/intro_screen.dart';

import 'signin_screen.dart';

var buttonList = [];

class SignupScreen extends StatelessWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: kLinearGradient,
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        // backgroundColor: appColor,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 50.0,
                  ),
                  Text(
                    'JOIN US!',
                    style: TextStyle(
                      fontSize: 50.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 70.0,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontFamily: 'SukarBlack',
                          // fontWeight: FontWeight.w300,
                        ),
                        children: <TextSpan>[
                          TextSpan(text: 'BECOME A MEMBER OF'),
                          TextSpan(
                            text: ' REHNUMA',
                            style: const TextStyle(fontSize: 27.0),
                          ),
                          TextSpan(text: ' FAMILY'),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 60.0,
              ),
              Container(
                height: 230.0,
                padding: const EdgeInsets.symmetric(horizontal: 45.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SignupButton(
                      text: 'Continue with Google',
                      image: 'assets/images/google.png',
                    ),
                    SignupButton(
                      text: 'Continue with Facebook',
                      image: 'assets/images/fb.png',
                    ),
                    SignupButton(
                      text: 'Create Account',
                      image: 'assets/images/userr.png',
                    ),
                    // SizedBox(
                    //   height: 10.0,
                    // ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        'Already have an account?',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SignupButton extends StatelessWidget {
  final String text;
  final String image;
  const SignupButton({Key? key, required this.text, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => IntroScreen(),
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffd7d9d6),
        ),
        width: 300,
        height: 50,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Image.asset(image, fit: BoxFit.cover),
              ),
            ),
            SizedBox(
              width: 5.0,
            ),
            Text(
              text,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
            )
          ],
        ),
      ),
    );
  }
}
