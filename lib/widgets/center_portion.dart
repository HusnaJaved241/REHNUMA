import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/personalize_space.dart';
import 'package:rehnuma/widgets/choose_avatar.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';
import 'package:rehnuma/widgets/date_picker.dart';
import 'package:rehnuma/widgets/goal_cards.dart';

import 'gender_widget.dart';

final widgetList = [
  CenterWidget(
    height: 250.0,
    question: 'First Things First!!!',
    questionDesc: 'What should we call you?',
    acutalWidget: CustomTextField(
      hint: 'TYPE YOUR NAME',
      inputType: TextInputType.name,
    ),
  ),
  CenterWidget(
    height: 250.0,
    question: 'SALAM username!',
    questionDesc: 'What\'s your email?',
    acutalWidget: CustomTextField(
      hint: 'TYPE YOUR EMAIL',
      inputType: TextInputType.emailAddress,
    ),
  ),
  CenterWidget(
    height: 350.0,
    question: 'When were you born?',
    questionDesc: 'Knowing this will help us make REHNUMA better for you',
    acutalWidget: ScrollingDatePicker(),
  ),
  CenterWidget(
    height: 400.0,
    question: 'How do you identify?',
    questionDesc: 'Knowing your gender help us give you better visuals',
    acutalWidget: GenderWidget(),
  ),
  CenterWidget(
    height: 500.0,
    question: 'Long-term Goal',
    questionDesc: 'What would you like to improve in your life?',
    acutalWidget: GoalCards(),
  ),
  CenterWidget(
    height: 500.0,
    question: 'Hey, good looking!',
    questionDesc: 'Customizing your avatar makes REHNUMA fun',
    acutalWidget: ChooseAvatar(),
  ),
];

class CenterPortion extends StatelessWidget {
  final widgetListCount;
  CenterPortion(
    this.widgetListCount,
  );
  @override
  Widget build(BuildContext context) {
  
      return widgetList[widgetListCount];
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
        color: Color(0xffc0ffa6),
      ),
      margin: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(question,
                    textAlign: TextAlign.center, style: kQuestionTextStyle),
                Text(questionDesc,
                    textAlign: TextAlign.center, style: kQuestionDescStyle),
              ],
            ),
          ),
          acutalWidget,
        ],
      ),
    );
  }
}
