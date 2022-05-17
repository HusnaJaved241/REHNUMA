import 'package:flutter/material.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'masnoon_dua_screen.dart';

class EmotionBasedDuaScreen extends StatelessWidget {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            SearchBar(
              focusNode: focusNode,
            ),
          ],
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
                builder: (context) => DuaScreen(),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/images/Background.jpg'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Emotion Based Dua',
                      style: kQuestionTextStyle,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 10.0,
                    ),
                    height: (MediaQuery.of(context).size.height),
                    child: ListView(
                      children: [
                        AnimatedTile(
                          text: 'Angry',
                        ),
                        AnimatedTile(
                          text: 'Anticipation',
                        ),
                        AnimatedTile(
                          text: 'Anxious',
                        ),
                        AnimatedTile(
                          text: 'Confident',
                        ),
                        AnimatedTile(
                          text: 'Confused',
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