import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:rehnuma/widgets/elevated_button.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storyController = StoryController();
  var storyItems = [
    StoryItem.pageProviderImage(
      AssetImage('assets/story_screens/1.jpg'),
      imageFit: BoxFit.fill,
    ),
    StoryItem.pageProviderImage(
      AssetImage('assets/story_screens/2.jpg'),
      imageFit: BoxFit.fill,
    ),
    StoryItem.pageProviderImage(
      AssetImage('assets/story_screens/3.jpg'),
      imageFit: BoxFit.fill,
    ),
    StoryItem.pageProviderImage(
      AssetImage('assets/story_screens/4.jpg'),
      imageFit: BoxFit.fill,
    ),
  ];
  @override
  void dispose() {
    storyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            child: StoryView(
              storyItems: storyItems,
              onComplete: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SignupScreen(),
                  ),
                );
              },
              progressPosition: ProgressPosition.top,
              repeat: false,
              controller: storyController,
            ),
          ),
          Positioned(
            bottom: 45.0,
            child: CustomElevatedButton(
              btnName: 'GET STARTED',
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SignupScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
