import 'package:flutter/material.dart';
import 'package:rehnuma/models/qassas.dart';
import 'package:rehnuma/navigation%20screens/qassas_screen.dart';

import '../constants.dart';

class newStory extends StatelessWidget {
  newStory({Key? key, required this.index}) : super(key: key);
  List qassas = qassasList;
  final int index;

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
        padding: const EdgeInsets.all(16.0),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  qassas[index].name,
                  style: kQuestionTextStyle,
                ),
                Text(
                  'Introduction',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      // fontFamily: 'SukarBlack',
                      fontWeight: FontWeight.bold),
                ),
                Text(qassas[index].introduction, style: kNormalTextStyle),
                Text(
                  'Story',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black,
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  qassas[index].story,
                  style: kNormalTextStyle,
                ),
                Text(
                  'Mentioned in Quran',
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  qassas[index].hawala,
                  style: kNormalTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
