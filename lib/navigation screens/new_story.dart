import 'package:flutter/material.dart';
import 'package:rehnuma/models/qassas.dart';
import 'package:rehnuma/navigation%20screens/qassas_screen.dart';

import '../constants.dart';

class newStory extends StatelessWidget {
  // const newStory({Key? key}) : super(key: key);
  List qassas = qassasList;

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
                  qassas[0].name,
                  style: kQuestionTextStyle,
                ),
                Text(
                  'Introduction',
                  style: kBigWhiteTextStyle,
                ),
                Text(
                  qassas[1].introduction,
                  style: kWhiteTextStyle,
                ),
                Text(
                  'Story',
                  style: kBigWhiteTextStyle,
                ),
                Text(
                  qassas[1].story,
                  style: kWhiteTextStyle,
                ),
                Text(
                  'Mentioned in Quran',
                  style: kBigWhiteTextStyle,
                ),
                Text(
                  qassas[1].hawala,
                  style: kWhiteTextStyle,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
