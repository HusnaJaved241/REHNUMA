import 'package:flutter/material.dart';
import 'package:rehnuma/screens/personalize_space.dart';
import 'package:rehnuma/widgets/center_portion.dart';
import 'package:rehnuma/widgets/upper_portion.dart';

class IntroScreen extends StatefulWidget {
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int widgetCount = 0;
  int progressBarIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc0ffa6),
      
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_outlined,
                  color: Colors.black,
                  size: 30.0,
                  
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              UpperPortion(
                progressBarIndex,
              ),
            ],
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus!.unfocus();
        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CenterPortion(widgetCount),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {
          setState(() {
            if (widgetCount < 5 && progressBarIndex < 6) {
              progressBarIndex++;
              widgetCount++;
            } else if (widgetCount == 5 && progressBarIndex == 6) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalizeApp(),
                ),
              );
            } else if (widgetCount > 5 && progressBarIndex > 6) {
              widgetCount--;
              progressBarIndex--;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalizeApp(),
                ),
              );
            }
          });
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
