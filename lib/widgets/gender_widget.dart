import 'package:flutter/material.dart';
import 'package:gender_picker/gender_picker.dart';
import 'package:gender_picker/source/enums.dart';

Widget ButtonStyle(String gender, Color color) {
  return GestureDetector(
    child: Container(
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
        ),),
  );
}

class GenderWidget extends StatelessWidget {
  const GenderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonStyle(
          'MALE',
          Color(0xff0c687f),
        ),
        ButtonStyle(
          'FEMALE',
          Color(0xfff28d9f),
        ),
        ButtonStyle(
          'OTHER',
          Color(0xff31a751),
        ),
      ],
    );
    //  return Container(
    //   // margin: EdgeInsets.symmetric(vertical: 40),
    //   alignment: Alignment.center,
    //   child: GenderPickerWithImage(
    //     showOtherGender: true,
    //     verticalAlignedText: true,

    //     // to show what's selected on app opens, but by default it's Male
    //     // selectedGender: Gender.Male,
    //     selectedGenderTextStyle: TextStyle(
    //       color: Color(0xFF8b32a8),
    //       fontWeight: FontWeight.w700,
    //       fontSize: 25.0,
    //     ),
    //     unSelectedGenderTextStyle: TextStyle(
    //       color: Colors.black,
    //       fontWeight: FontWeight.normal,
    //       fontSize: 20.0,
    //     ),
    //     onChanged: (Gender? gender) {
    //       print(gender);
    //     },
    //     //Alignment between icons
    //     equallyAligned: true,

    //     animationDuration: Duration(milliseconds: 300),
    //     isCircular: true,
    //     // default : true,
    //     opacityOfGradient: 0.4,
    //     padding: const EdgeInsets.all(3),
    //     size: 70.0, //default : 40
    //   ),
    // );
  }
}
