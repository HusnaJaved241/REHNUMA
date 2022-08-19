import 'package:flutter/material.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:rehnuma/models/azkar_model.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';
import 'package:rehnuma/navigation%20screens/masnoon_dua_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'emotionbased_dua_screen.dart';

class ZikarScreen extends StatelessWidget {
  List zikrList = azkarList;

  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                height: MediaQuery.of(context).size.height,
                child: CustomListView(
                  header: Container(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: SelectableText(
                      'Azkar',
                      style: kQuestionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // shrinkWrap: true,
                  pageSize: 20,
                  padding: const EdgeInsets.only(bottom: 12.0),
                  itemBuilder: (context, index, dynamic item) {
                    return AnimatedTile2ForZikr(
                      text: zikrList[index].dua,
                      dua: "Translation: " + zikrList[index].translation,
                      translation:
                          "Significance: " + zikrList[index].significance,
                    );
                  },
                  itemCount: zikrList.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedTile2ForZikr extends StatefulWidget {
  const AnimatedTile2ForZikr({
    Key? key,
    required this.text,
    required this.dua,
    required this.translation,
  }) : super(key: key);
  final text, dua, translation;

  @override
  State<AnimatedTile2ForZikr> createState() => _AnimatedTile2ForZikrState();
}

class _AnimatedTile2ForZikrState extends State<AnimatedTile2ForZikr> {
  double _animatedHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffD9D9D9), borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () => setState(() {
              _animatedHeight != 0.0
                  ? _animatedHeight = 0.0
                  : _animatedHeight = 200.0;
            }),
            child: Container(
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: Color(0xffB788B7),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Align(
                // alignment: Alignment.centerRight,
                child: Text(
                  widget.text,
                  style: TextStyle(
                      fontSize: 22.0, color: Colors.white, fontFamily: 'Amiri'),
                  textAlign: TextAlign.center,
                ),
              ),
              height: MediaQuery.of(context).size.height * .1,
            ),
          ),
          new AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    widget.dua,
                    style: kSignupButtonTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Text(
                    widget.translation,
                    style: kSignupButtonTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            height: _animatedHeight,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }
}
