import 'package:flutter/material.dart';
import 'package:intervalprogressbar/intervalprogressbar.dart';

class UpperPortion extends StatelessWidget {
  const UpperPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          IntervalProgressBar(
            direction: IntervalProgressDirection.horizontal,
            max: 7,
            progress: 1,
            intervalSize: 2,
            size: Size(300, 3),
            highlightColor: Colors.deepPurple,
            defaultColor: Colors.grey,
            intervalColor: Colors.transparent,
            intervalHighlightColor: Colors.transparent,
            reverse: false,
            radius: 10.0,
          ),
        ],
      ),
    );
  }
}
