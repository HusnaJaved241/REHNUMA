import 'package:flutter/material.dart';
import 'package:rehnuma/widgets/date_picker.dart';
import 'package:rehnuma/widgets/goal_cards.dart';

import 'gender_widget.dart';

// DateTime _selectedDate = DateTime.now();

final widgetList = [
  CenterWidget(
    height: 250.0,
    question: 'First Things First!!!',
    questionDesc: 'What should we call you?',
    acutalWidget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        style: TextStyle(fontSize: 30.0),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
          hintText: 'TYPE YOUR NAME',
          hintStyle: TextStyle(
            fontSize: 30.0,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
  CenterWidget(
    height: 250.0,
    question: 'Salam username!',
    questionDesc: 'What\'s your email?',
    acutalWidget: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        style: TextStyle(fontSize: 30.0),
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          hintText: 'Type your email',
          hintStyle: TextStyle(
            fontSize: 30.0,
          ),
        ),
        textAlign: TextAlign.center,
      ),
    ),
  ),
  CenterWidget(
    height: 350.0,
    question: 'When were you born?',
    questionDesc: 'Knowing this will make us REHNUMA better for you',
    acutalWidget: ScrollingDatePicker(),
  ),
  CenterWidget(
    height: 300.0,
    question: 'How to identify you?',
    questionDesc:
        'Knowing your gender help us provide you with better theme colors',
    acutalWidget: GenderWidget(),
  ),
  CenterWidget(
    height: 300.0,
    question: 'What\'s your long-term goal?',
    questionDesc: 'What would you like to improve in your life',
    acutalWidget: GoalCards(),
  ),
];


class CenterPortion extends StatelessWidget {
  const CenterPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return widgetList[1];
  }
}

class CenterWidget extends StatelessWidget {
  final String question;
  final String questionDesc;
  final Widget acutalWidget;
  final double height;
  const CenterWidget({
    Key? key,
    required this.question,
    required this.questionDesc,
    required this.acutalWidget,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: Colors.white12,
      ),
      margin: const EdgeInsets.only(
        top: 40.0,
        left: 30.0,
        right: 30.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  questionDesc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.w700
                  ),
                ),
              ],
            ),
          ),
          acutalWidget,
        ],
      ),
    );
  }
}

