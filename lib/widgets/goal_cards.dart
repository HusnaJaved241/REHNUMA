import 'package:flutter/material.dart';

import '../constants.dart';
import '../navigation screens/dua_screen.dart';
import '../screens/more_screen.dart';

class GoalCards extends StatefulWidget {
  String goal = "";

  @override
  State<GoalCards> createState() => _GoalCardsState();
}

class _GoalCardsState extends State<GoalCards> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: GoalImagewithLabel(
                      assetName: 'assets/images/live-successful-life.png',
                      title: 'Live a successful life',
                      newScreen: DuaScreen(),
                    ),
                  ),
                  Expanded(
                    child: GoalImagewithLabel(
                      assetName: 'assets/images/become-better-muslim.jpg',
                      title: 'Become a better Muslim',
                      newScreen: DuaScreen(),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: GoalImagewithLabel(
                      assetName: 'assets/images/improve-relationships.png',
                      title: 'Improve Relatonships',
                      newScreen: DuaScreen(),
                    ),
                  ),
                  Expanded(
                    child: GoalImagewithLabel(
                      assetName: 'assets/images/strengthen-faith.png',
                      title: 'Strengthen Faith & Patience',
                      newScreen: DuaScreen(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
      // alignment: Alignment.center,
      // padding: const EdgeInsets.only(
      //   bottom: 40.0,
      // ),
      // child: Column(
      //   children: [
      //     Row(
      //       children: [
      //         SizedBox(
      //           width: 10.0,
      //         ),
      //         Cards(
      //           cardText: "Peace",
      //           onPressed: () {
      //             setState(() {
      //               widget.goal = "Peace";
      //             });
      //           },
      //         ),
      //         SizedBox(
      //           width: 30.0,
      //         ),
      //         Cards(
      //           cardText: "Career",
      //           onPressed: () {
      //             setState(() {
      //               widget.goal = "Career";
      //             });
      //           },
      //         ),
      //       ],
      //     ),
      //     SizedBox(
      //       height: 10.0,
      //     ),
      //     Row(
      //       children: [
      //         SizedBox(
      //           width: 10.0,
      //         ),
      //         Cards(
      //           cardText: "Be Successful",
      //           onPressed: () {
      //             setState(() {
      //               widget.goal = "Be Successful";
      //             });
      //           },
      //         ),
      //         SizedBox(
      //           width: 30.0,
      //         ),
      //         Cards(
      //           cardText: "Pray",
      //           onPressed: () {
      //             setState(() {
      //               widget.goal = "Pray";
      //             });
      //           },
      //         ),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}

// class Cards extends StatelessWidget {
//   const Cards({
//     Key? key,
//     required this.cardText,
//     required this.onPressed,
//   }) : super(key: key);
//   final cardText;
//   final onPressed;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPressed,
//       child: Card(
//         elevation: 10,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(20.0),
//         ),
//         child: Container(
//           child: Center(
//               child: Text(
//             cardText,
//             style: TextStyle(color: Colors.white, fontSize: 20.0),
//           )),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(
//               20.0,
//             ),
//             boxShadow: <BoxShadow>[
//               BoxShadow(
//                 color: Color(0xff91ac9d),
//                 blurRadius: 2.0,
//                 spreadRadius: 0.0,
//                 offset: Offset(4.0, 4.0),
//               ),
//             ],
//             color: Color(0xff73bb55),
//           ),
//           height: 140.0,
//           width: 130.0,
//         ),
//       ),
//     );
//   }
// }

// // 91ac9d

class GoalImagewithLabel extends StatelessWidget {
  const GoalImagewithLabel(
      {Key? key,
      required this.assetName,
      required this.title,
      required this.newScreen})
      : super(key: key);
  final String assetName;
  final String title;
  final Widget newScreen;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => newScreen),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 15.0, right: 10.0, left: 10.0),
        // padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Color(0xFF8EACBB),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image.asset(
                assetName,
                height: 100.0,
                width: 120.0,
              ),
            ),
            Text(
              title,
              style: kQuestionDescStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
