import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class HomeCard extends StatelessWidget {
  final height;
  final child;
  const HomeCard({Key? key, required this.height, required this.child})
      : super(key: key);

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
      height: height,
      width: MediaQuery.of(context).size.width,
      child: child,
    );
  }
}

class Card1 extends StatelessWidget {
  const Card1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Good Evening,',
          style: TextStyle(
            fontSize: 23.0,
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
                    'February 2, 2022',
                    style: kCard1TextStyle,
                  ),
                  Text(
                    'Jumada ll 30, 1443 AH',
                    style: kCard1TextStyle,
                  ),
                  Text(
                    'Monday',
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,

      children: [
        Container(
          margin: const EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 12.0,
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 5.0,
            vertical: 8.0,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              width: 3.0,
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
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              calendarContainer(),
              calendarContainer(),
              calendarContainer(),
              calendarContainer(),
              calendarContainer(),
              calendarContainer(),
            ],
          ),
        ),
      ],
    );
  }
}

Widget calendarContainer() {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 5.0),
    margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2.0
      ),
      borderRadius: BorderRadius.circular(8.0)
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

