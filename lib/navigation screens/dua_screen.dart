import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/search_bar.dart';
import 'package:rehnuma/navigation%20screens/emotionbased_dua_screen.dart';
import 'package:rehnuma/navigation%20screens/masnoon_dua_screen.dart';
import 'package:rehnuma/navigation%20screens/new_story.dart';
import 'package:rehnuma/screens/home_screen.dart';
import '../constants.dart';
import '../screens/more_screen.dart';

class DuaScreen extends StatelessWidget {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
         
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
                builder: (context) => MoreScreen(),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Dua',
                      style: kQuestionTextStyle,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/Dua.jpg'),
                          fit: BoxFit.fill),
                    ),
                    height: 190.0,
                    margin: const EdgeInsets.symmetric(
                      vertical: 10.0,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 60.0,
                    ),
                    // height: (MediaQuery.of(context).size.height),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomTile(
                          text: 'Masnoon Dua',
                          newScreen: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MasnoonDuaScreen()));
                          },
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        CustomTile(
                          text: 'Emotion Based Dua',
                          newScreen: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        EmotionBasedDuaScreen()));
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.text, required this.newScreen})
      : super(key: key);
  final String text;
  final Function() newScreen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: newScreen,
      child: Container(
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child:
              Text(text, style: TextStyle(color: Colors.white, fontSize: 25.0)),
        ),
        height: 55.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
      ),
    );
  }
}
