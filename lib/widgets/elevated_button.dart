import 'package:flutter/material.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/otp_screen.dart';

import '../constants.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton(
      {Key? key, required this.btnName, required this.onPressed})
      : super(key: key);
  final String btnName;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 180.0,
      // margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: kElevatedButtonColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(35.0),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 22.0,
            vertical: 15.0,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              btnName,
              style: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
           
          ],
        ),
        onPressed: onPressed
      ),
    );
  }
}
