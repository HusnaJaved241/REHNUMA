import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/today_performa_screen.dart';

class HomeCard extends StatelessWidget {
  // final height;
  final child;
  // const HomeCard({Key? key, required this.height, required this.child})
  const HomeCard({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 10.0),
      decoration: BoxDecoration(
        color: appColor,
        borderRadius: BorderRadius.circular(
          5.0,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black54,
            blurRadius: 7.0,
            spreadRadius: 2.0,
          ),
        ],
      ),
      // height: height,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}

class Card1 extends StatelessWidget {
  final now = DateTime.now();
  HijriCalendar today = HijriCalendar.now();
  String greeting() {
    var timeNow = DateTime.now().hour;
    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow <= 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          greeting(),
          style: TextStyle(
            fontSize: 20.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                Icons.cloud_queue,
                size: 50.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    DateFormat.yMMMMd().format(now).toString(),
                    style: kCard1TextStyle,
                  ),
                  Text(
                    today.toFormat("MMMM ll dd, yyyy").toString(),
                    style: kCard1TextStyle,
                  ),
                  Text(
                    DateFormat.EEEE().format(now).toString(),
                    style: kCard1TextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Card2 extends StatelessWidget {
  const Card2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => TodayPerformaScreen()));
          },
          child: Expanded(
            child: Container(
              margin: const EdgeInsets.only(
                top: 7.0,
                // horizontal: 8.0,
              ),
              padding: const EdgeInsets.symmetric(
                horizontal: 5.0,
                vertical: 8.0,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                ),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Text(
                'How are you feeling today?',
                style: kQuestionDescStyle,
              ),
            ),
          ),
        ),
       
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              dateWithEmotionContainer(),
              dateWithEmotionContainer(),
              dateWithEmotionContainer(),
              dateWithEmotionContainer(),
              dateWithEmotionContainer(),
              dateWithEmotionContainer(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget dateWithEmotionContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 3.0,
      vertical: 5.0,
    ),
    margin: const EdgeInsets.symmetric(
      horizontal: 4.0,
      vertical: 8.0,
    ),
    decoration: BoxDecoration(
      border: Border.all(width: 2.0),
      borderRadius: BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        Text(
          '29 Jan',
          style: kCard1TextStyle,
        ),
        Text(
          'Angry',
          style: kCard1TextStyle,
        ),
      ],
    ),
  );
}

class Card3 extends StatelessWidget {
  const Card3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(10.0)
      // ),
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
          fit: BoxFit.fill,
          image: AssetImage('assets/images/ayat1.jpeg'),
        ),
      ),
    );
  }
}
