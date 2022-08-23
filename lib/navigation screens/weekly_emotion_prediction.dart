import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';

import '../constants.dart';
import '../models/date_model.dart';

class WeeklyEmotionPredictionScreen extends StatefulWidget {
  @override
  State<WeeklyEmotionPredictionScreen> createState() =>
      _WeeklyEmotionPredictionScreenState();
}

class _WeeklyEmotionPredictionScreenState
    extends State<WeeklyEmotionPredictionScreen> {
  final result = 'Good';
  String? inputText;
  final sentiment = Sentiment();
  Map? sentimentOutput;
  @override
  void initState() {
    // TODO: implement initState
    inputText = "happy";
    setState(() {
      sentimentOutput = sentiment.analysis(inputText!, emoji: true);
    });

    super.initState();
  }
Future<QuerySnapshot<Map<String, dynamic>>> getRecentDocs() async {

  final Timestamp now = Timestamp.fromDate(DateTime.now());
  final Timestamp yesterday = Timestamp.fromDate(
    DateTime.now().subtract(const Duration(days: 1)),
  );

  final query = FirebaseFirestore.instance
      .collection('collectionPath')
      .where('createdAt', isLessThan: now, isGreaterThan: yesterday);

  return query.get();
}
  String getResult() {
    if (sentimentOutput!['score'] > 0) {
      return "Positivity";
    } else if ((sentimentOutput!['score'] < 0)) {
      return "Negativity";
    } else {
      return "Neutrality";
    }
  }

  String getSentimentDesc() {
    if (sentimentOutput!['score'] > 0) {
      return "It is always overwhelming to see you growing and nurturing happily.";
    } else if ((sentimentOutput!['score'] < 0)) {
      return "Don't loose hope. You're brave enough to overcome this!";
    } else {
      return "We just hope that it is more about smiles and good thoughts";
    }
  }

  String emojiOutput() {
    if (sentimentOutput!['score'] > 0) {
      return "assets/sentiments/happy.png";
    } else if ((sentimentOutput!['score'] < 0)) {
      return "assets/sentiments/sad.png";
    } else {
      return "assets/sentiments/neutral.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            minimum: EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Text(
                    'REHNUMA SAYS:',
                    style: kQuestionTextStyle,
                    textAlign: TextAlign.start,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'Your week was filled with ',
                      style: TextStyle(
                        fontFamily: 'SukarBlackRegular',
                        fontSize: 22.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      getResult(),
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(
                          getSentimentDesc(),
                          style: TextStyle(
                            fontFamily: 'SukarBlackRegular',
                            fontSize: 22.0,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: Image.asset(
                          emojiOutput(),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
