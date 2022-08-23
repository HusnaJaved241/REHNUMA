import 'package:flutter/material.dart';
import 'package:rehnuma/appvariables.dart';
import 'package:rehnuma/constants.dart';

Widget buttonStyle(String gender, Color color, Function() onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Builder(builder: (context) {
      return Container(
        width: 200.0,
        padding: const EdgeInsets.symmetric(
          // horizontal: 40.0,
          vertical: 10.0,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        child: Text(
          gender,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
    }),
  );
}

class GenderWidget extends StatefulWidget {
  String gender = "";

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            buttonStyle(
              'MALE',
              Color(0xff0c687f),
              () {
                setState(() {
                  widget.gender = "Male";
                  print(widget.gender);
                  AppVariables.selectedGender = "MALE";
                });
              },
            ),
            Container(height: 25,width: 25, decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppVariables.selectedGender == "MALE"?appColor:Colors.transparent
            ),
              child: Center(child: AppVariables.selectedGender == "MALE"?Icon(Icons.check):Container()),
            )
          ],
        ),
        Stack(
          children: [
            buttonStyle('FEMALE', Color(0xfff28d9f), () {
              setState(
                () {
                  widget.gender = 'Female';
                  print(widget.gender);
                  AppVariables.selectedGender = "FEMALE";
                },
              );
            }),
            Container(height: 25,width: 25, decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppVariables.selectedGender == "FEMALE"?appColor:Colors.transparent
            ),
              child: Center(child: AppVariables.selectedGender == "FEMALE"?Icon(Icons.check):Container()),
            )
          ],
        ),
        Stack(
          children: [
            buttonStyle('OTHER', Color(0xff742d74), () {
              setState(() {
                widget.gender = 'Other';
                  print(widget.gender);
                AppVariables.selectedGender = "OTHER";
              });
            }),
            Container(height: 25,width: 25, decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppVariables.selectedGender == "OTHER"?appColor:Colors.transparent
            ),
              child: Center(child: AppVariables.selectedGender == "OTHER"?Icon(Icons.check):Container()),
            )
          ],
        ),
      ],
    );
  }
}
