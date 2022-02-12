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
);

final  kTextFieldDecoration = InputDecoration(
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
