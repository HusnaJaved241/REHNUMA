import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';


class GenderWidget extends StatelessWidget {
  const GenderWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return Container(
    // margin: EdgeInsets.symmetric(vertical: 40),
    alignment: Alignment.center,
    child: GenderPickerWithImage(
      showOtherGender: true,
      verticalAlignedText: true,

      // to show what's selected on app opens, but by default it's Male
      selectedGender: Gender.Male,
      selectedGenderTextStyle: TextStyle(
        color: Color(0xFF8b32a8),
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
      unSelectedGenderTextStyle: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.normal,
        fontSize: 20.0,
      ),
      onChanged: (Gender? gender) {
        print(gender);
      },
      //Alignment between icons
      equallyAligned: true,

      animationDuration: Duration(milliseconds: 300),
      isCircular: true,
      // default : true,
      opacityOfGradient: 0.4,
      padding: const EdgeInsets.all(3),
      size: 70.0, //default : 40
    ),
  );
  }
}