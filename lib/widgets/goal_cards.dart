import 'package:flutter/material.dart';
import 'package:rehnuma/appvariables.dart';

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
      color: Colors.white,
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height * 0.4,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GoalImagewithLabel(
                        assetName: 'assets/images/live-successful-life.png',
                        title: 'Live a successful life',
                        newScreen: DuaScreen(),
                        onTap: () {
                          setState(() {
                            AppVariables.selectedGoal =
                                'Live a successful life';
                          });
                        },
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppVariables.selectedGoal ==
                                    "Live a successful life"
                                ? Colors.greenAccent
                                : Colors.transparent),
                        child: Center(
                            child: AppVariables.selectedGoal ==
                                    "Live a successful life"
                                ? Icon(Icons.check)
                                : Container()),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GoalImagewithLabel(
                        assetName: 'assets/images/become-better-muslim.jpg',
                        title: 'Become a better Muslim',
                        newScreen: DuaScreen(),
                        onTap: () {
                          AppVariables.selectedGoal =
                              'Become a better Muslim';
                          setState(() {});
                        },
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppVariables.selectedGoal ==
                                    "Become a better Muslim"
                                ? Colors.greenAccent
                                : Colors.transparent),
                        child: Center(
                          child: AppVariables.selectedGoal ==
                                  "Become a better Muslim"
                              ? Icon(Icons.check)
                              : Container(),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Stack(
                    children: [
                      GoalImagewithLabel(
                        assetName: 'assets/images/improve-relationships.png',
                        title: 'Improve Relationships',
                        newScreen: DuaScreen(),
                        onTap: () {
                          AppVariables.selectedGoal = 'Improve Relationships';
                          setState(() {});
                        },
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppVariables.selectedGoal ==
                                    "Improve Relationships"
                                ? Colors.greenAccent
                                : Colors.transparent),
                        child: Center(
                            child: AppVariables.selectedGoal ==
                                    "Improve Relationships"
                                ? Icon(Icons.check)
                                : Container()),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      GoalImagewithLabel(
                        assetName: 'assets/images/strengthen-faith.png',
                        title: 'Strengthen Faith & Patience',
                        newScreen: DuaScreen(),
                        onTap: () {
                          AppVariables.selectedGoal =
                              'Strengthen Faith & Patience';
                          setState(() {});
                        },
                      ),
                      Container(
                        height: 25,
                        width: 25,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppVariables.selectedGoal ==
                                    "Strengthen Faith & Patience"
                                ? Colors.greenAccent
                                : Colors.transparent),
                        child: Center(
                            child: AppVariables.selectedGoal ==
                                    "Strengthen Faith & Patience"
                                ? Icon(Icons.check)
                                : Container()),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class GoalImagewithLabel extends StatefulWidget {
  const GoalImagewithLabel(
      {Key? key,
      required this.assetName,
      required this.title,
      required this.newScreen,
      required this.onTap})
      : super(key: key);
  final String assetName;
  final String title;
  final Widget newScreen;
  final Function() onTap;

  @override
  State<GoalImagewithLabel> createState() => _GoalImagewithLabelState();
}

class _GoalImagewithLabelState extends State<GoalImagewithLabel> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                widget.assetName,
                height: 100.0,
                width: 120.0,
              ),
            ),
            Text(
              widget.title,
              style: kQuestionDescStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
