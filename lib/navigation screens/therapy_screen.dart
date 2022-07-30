import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'dua_screen.dart';

class TherapyScreen extends StatelessWidget {
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
                image: AssetImage('assets/images/Background.jpg'),
                fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Text(
                      'Therapies',
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
                        CustomTileTherapy(
                          text: 'Practice Gratitute',
                        ),
                        CustomTileTherapy(
                          text: 'Mindfulness Techniques',
                        ),
                        CustomTileTherapy(
                          text: 'Meditation',
                        ),
                        CustomTileTherapy(
                          text: 'Concetration Techniques',
                        ),
                        CustomTileTherapy(
                          text: 'Journaling and Thought records',
                        ),
                        CustomTileTherapy(
                          text: 'Role Playing',
                        ),
                        CustomTileTherapy(
                          text: 'Relaxation and stress reduction',
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

class CustomTileTherapy extends StatelessWidget {
  const CustomTileTherapy({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // onTap: ( ){
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => newScreen));
      // },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffB788B7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.012,
          horizontal: MediaQuery.of(context).size.width * 0.012,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
        // height: 55.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
      ),
    );
  }
}
