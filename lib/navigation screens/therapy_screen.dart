import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehnuma/screens/home_screen.dart';

import '../constants.dart';

class TherapyScreen extends StatelessWidget {
  const TherapyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          title: Text(
            'Therapies',
            style: (kQuestionDescStyle),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 27.0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
              ),
            ),
          ),
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmojiContainer(
                    assetName: 'assets/svgs/happy.svg',
                    title: 'Happy',
                  ),
                  EmojiContainer(
                    assetName: 'assets/svgs/fearful.svg',
                    title: 'Fear',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmojiContainer(
                    assetName: 'assets/svgs/sad.svg',
                    title: 'Sad',
                  ),
                  EmojiContainer(
                    assetName: 'assets/svgs/angry.svg',
                    title: 'Angry',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  EmojiContainer(
                    assetName: 'assets/svgs/surprised.svg',
                    title: 'Surprised',
                  ),
                  EmojiContainer(
                    assetName: 'assets/svgs/disgusted.svg',
                    title: 'Disgusted',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmojiContainer extends StatelessWidget {
  const EmojiContainer({Key? key, required this.assetName, required this.title})
      : super(key: key);
  final String assetName;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          SvgPicture.asset(
            assetName,
          ),
          Text(
            title,
            style: kQuestionDescStyle,
          ),
        ],
      ),
    );
  }
}
