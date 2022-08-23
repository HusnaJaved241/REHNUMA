import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class UpperPortion extends StatelessWidget {
  final progressBarIndex;
  UpperPortion(
    this.progressBarIndex,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: kDrawerColor, width: 4.0),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10.0)),
              child: StepProgressIndicator(
                totalSteps: 6,
                currentStep: progressBarIndex,
                size: 9,
                fallbackLength: 250.0,
                padding: 0,
                selectedColor: Color(0xff742d74),
                unselectedColor: kDrawerColor,
                roundedEdges: Radius.circular(10),
                //
              ),
            ),
          ),
          SizedBox(
            width: 35.0,
          ),
        ],
      ),
    );
  }
}

// 7ccfb5 --> background
// f9bb04 -> yellow
