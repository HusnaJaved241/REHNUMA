import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final kSignupButtonTextStyle = TextStyle(
  fontSize: 20.0,
);

const kQuestionTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

const kQuestionDescStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
  color: Colors.black,
);

final kTextFieldDecoration = InputDecoration(
  hintText: 'TYPE YOUR NAME',
  hintStyle: TextStyle(
    fontSize: 30.0,
  ),
  focusedBorder: OutlineInputBorder(
    // borderRadius: BorderRadius.circular(30),
    borderSide: BorderSide(
      color: Colors.transparent,
    ),
  ),
);

const kCard1TextStyle = TextStyle(
  fontSize: 20.0,
);
const appColor = Color(0xff9C77B8);
// DFFF33  --> to be added in gradient
const kLinearGradient = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [
    // appColor,
    Color(0xffA8F3CF),
    Color(0xffC2F495),
    Color(0xffF9FE94),
  ],
);
