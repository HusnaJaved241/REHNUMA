import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:story_view/story_view.dart';

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  final storyController = StoryController();
  var storyItems = [
    StoryItem.pageProviderImage(AssetImage('assets/images/17.jpg'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/images/18.jpg'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/images/19.jpg'),
        imageFit: BoxFit.cover),
    StoryItem.pageProviderImage(AssetImage('assets/images/20.jpg'),
        imageFit: BoxFit.cover),
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
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xff34a855),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 30.0,
                  vertical: 17.0,
                ),
              ),
              child: Text(
                'GET STARTED',
                style: kQuestionDescStyle,
              ),
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
