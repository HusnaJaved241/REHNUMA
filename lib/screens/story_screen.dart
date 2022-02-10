import 'package:flutter/material.dart';
import 'package:rehnuma/screens/intro_screen.dart';
import 'package:rehnuma/screens/signup_screen.dart';
import 'package:story/story_page_view/story_page_view.dart';

class UserModel {
  UserModel(this.stories);

  final List<StoryModel> stories;
}

class StoryModel {
  final String imageUrl;
  StoryModel(this.imageUrl);
}

class StoryPage extends StatefulWidget {
  StoryPage({Key? key}) : super(key: key);

  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  late ValueNotifier<IndicatorAnimationCommand> indicatorAnimationController;
  final sampleUsers = [
    UserModel(
      [
        StoryModel("assets/images/17.jpg"),
        StoryModel("assets/images/18.jpg"),
        StoryModel("assets/images/19.jpg"),
        StoryModel("assets/images/20.jpg"),
      ],
    ),
  ];

  @override
  void initState() {
    super.initState();
    indicatorAnimationController = ValueNotifier<IndicatorAnimationCommand>(
        IndicatorAnimationCommand.resume);
  }

  @override
  void dispose() {
    indicatorAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoryPageView(
        itemBuilder: (context, pageIndex, storyIndex) {
          final user = sampleUsers[pageIndex];
          final story = user.stories[storyIndex];
          return Stack(
            children: [
              Positioned.fill(
                child: Container(color: Colors.black),
              ),
              Positioned.fill(
                child: Image.asset(
                  story.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          );
        },
        gestureItemBuilder: (context, pageIndex, storyIndex) {
          return Stack(
            alignment: Alignment.center,
            children: [
            // if (pageIndex == 0)
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
                  child: Text('GET STARTED', style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700
                  ),),
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  ),
                ),
              ),
          ]);
        },
        indicatorAnimationController: indicatorAnimationController,
        initialStoryIndex: (pageIndex) {
          if (pageIndex == 0) {
            return 1;
          }
          return 0;
        },
        pageLength: sampleUsers.length,
        storyLength: (int pageIndex) {
          return sampleUsers[pageIndex].stories.length;
        },
        onPageLimitReached: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignupScreen(),
            ),
          );
        },
      ),
    );
  }
}
