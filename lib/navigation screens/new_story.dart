import 'package:flutter/material.dart';
import 'package:rehnuma/navigation%20screens/qassas_screen.dart';

import '../constants.dart';

class newStory extends StatelessWidget {
  const newStory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              builder: (context) => QassasScreen(),
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
            child: Center(
              child: Text(
                'Hazrat Adam (AS)',
                style: kQuestionTextStyle,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
