import 'package:flutter/material.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:rehnuma/models/supplications.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'masnoon_dua_screen.dart';

class EmotionBasedDuaScreen extends StatelessWidget {
  FocusNode focusNode = FocusNode();
  List supplication = supplicationsList;

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
                      'Emotion Based Dua',
                      style: kQuestionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // shrinkWrap: true,
                  pageSize: 20,
                  padding: const EdgeInsets.only(bottom: 12.0),
                  itemBuilder: (context, index, dynamic item) {
                    return AnimatedTile2(
                      text: supplication[index].name,
                      dua: supplication[index].dua,
                      translation: supplication[index].translation,
                    );
                  },
                  itemCount: supplication.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedTile2 extends StatefulWidget {
  const AnimatedTile2({
    Key? key,
    required this.text,
    required this.dua,
    required this.translation,
  }) : super(key: key);
  final text, dua, translation;

  @override
  State<AnimatedTile2> createState() => _AnimatedTile2State();
}

class _AnimatedTile2State extends State<AnimatedTile2> {
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
              decoration: BoxDecoration(
                color: Color(0xffB788B7),
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
              ),
              child: Center(
                child: Text(
                  widget.text,
                  style: kBigWhiteTextStyle,
                ),
              ),
              height: 55.0,
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
