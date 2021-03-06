import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/search_bar.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

import '../constants.dart';
import 'dua_screen.dart';
import 'new_story.dart';

class QassasScreen extends StatelessWidget {
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
                    padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'Qassas-ul-Anbiya',
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
                        CustomTileQassas(text: 'Hazrat Adam (AS)',),
                        CustomTileQassas(text: 'Hazrat Idris (AS)',),
                        CustomTileQassas(text: 'Hazrat Nuh (AS)',),
                        CustomTileQassas(text: 'Hazrat Hood (AS)',),
                        CustomTileQassas(text: 'Hazrat Saleh (AS)',),
                        CustomTileQassas(text: 'Hazrat Lut (AS)',),
                        CustomTileQassas(text: 'Hazrat Ibrahim (AS)',),
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

class CustomTileQassas extends StatelessWidget {
  const CustomTileQassas({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => newStory()));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffB788B7),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(text, style: TextStyle(
            color: Colors.white,
            fontSize: 25.0
    
          )),
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