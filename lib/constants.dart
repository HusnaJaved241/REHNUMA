import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// for check box theme color
Color getColor(Set<MaterialState> states) {
  const Set<MaterialState> interactiveStates = <MaterialState>{
    MaterialState.pressed,
    MaterialState.hovered,
    MaterialState.focused,
  };
  if (states.any(interactiveStates.contains)) {
    return appColor;
  }
  return Color.fromARGB(255, 11, 54, 90);
}
final List<String> beABetterMuslim = [
  "assets/images/be_a_better_muslim_a.png",
  "assets/images/be_a_better_muslim_b.png",
  "assets/images/be_a_better_muslim_c.png",
  "assets/images/be_a_better_muslim_d.png",
  "assets/images/be_a_better_muslim_e.png"
];
final List<String> improveRelationships = [
  "assets/images/improve_relations_a.png",
  "assets/images/improve_relations_b.png",
  "assets/images/improve_relations_c.png",
  "assets/images/improve_relations_d.png",
  "assets/images/improve_relations_e.png"
];
final List<String> strongFaith = [
  "assets/images/stong_faith_a.png",
  "assets/images/stong_faith_b.png",
  "assets/images/stong_faith_c.png",
  "assets/images/stong_faith_d.png",
  "assets/images/stong_faith_e.png",
];
final List<String> success = [
  "assets/images/success_a.png",
  "assets/images/success_b.png",
  "assets/images/success_c.png",
  "assets/images/success_d.png",
  "assets/images/success_e.png",
];

final kTextColor = Color(0xff2A2A2A);

final kSignupButtonTextStyle = TextStyle(
  // fontWeight: FontWeight.bold,
  fontFamily: 'SularBlack',
  fontSize: 20.0,
);
final kNormalTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SukarBlackRegular',
  color: Colors.black87,
);
final kNormalBoldWhiteTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'SukarBlack',
  fontWeight: FontWeight.normal,
  color: Colors.white,
);

final kWhiteTextStyle = TextStyle(
  fontSize: 20.0,
  color: Colors.white,
);
final kBigWhiteTextStyle = TextStyle(
  fontSize: 23.0,
  color: Colors.white,
);

const kQuestionTextStyle = TextStyle(
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
    // color: Color(0xFF362F2F),
    color: Color(0xff2a2a2a));

const kQuestionDescStyle = TextStyle(
  fontSize: 22.0,
  fontWeight: FontWeight.w700,
  color: Color(0xFF362F2F),
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
  fontSize: 18.0,
);
const appColor = Color(0xffdbbcdd);
// const appColor = Color(0xff9C77B8);
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
const kElevatedButtonColor = Color(0xffe5a9ca);
const kDrawerColor = Color(0xffB788B7);
const bgImage2 = "assets/images/background2.jpg";
const bgImage = "assets/images/Background.jpg";
