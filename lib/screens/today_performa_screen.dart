import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:rehnuma/home_screen_widgets/search_bar.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

import '../constants.dart';

class TodayPerformaScreen extends StatefulWidget {
  @override
  State<TodayPerformaScreen> createState() => _TodayPerformaScreenState();
}

class _TodayPerformaScreenState extends State<TodayPerformaScreen> {
  FocusNode focusNode = FocusNode();

  // bool isChecked = false;
  double _value = 6.0;
  String selected = "";
  List checkList2 = [
    {
      "value": false,
      "title": "Prayed 5 times",
    },
    {
      "value": false,
      "title": "Recited Quran",
    },
    {
      "value": false,
      "title": "Avoided Backbiting",
    },
    {
      "value": false,
      "title": "Showed patience",
    },
    {
      "value": false,
      "title": "Had the best of Ikhlaaq",
    },
  ];

  List checkList1 = [
    {
      "value": false,
      "title": "Did you slept properly today?",
    },
    {
      "value": false,
      "title": "Did you ate properly today?",
    },
    {
      "value": false,
      "title": "Did you went for walk today?",
    },
    {
      "value": false,
      "title": "Did you spent some time for relaxation today?",
    },
  ];

  //for checkbox
  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.pressed,
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return appColor;
    }
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          toolbarHeight: 40.0,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.close,
              color: Colors.black,
              size: 27.0,
            ),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => HomeScreen(),
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
              physics: ClampingScrollPhysics(),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    // padding: const EdgeInsets.only(top: 20.0),
                    child: Text(
                      'How are you feeling?',
                      style: TextStyle(fontSize: 30.0),
                    ),
                  ),
                  CustomDivider(),
                  Heading(text: 'Emotion'),
                  Emotion(),
                  CustomDivider(),
                  Heading(text: 'Feeling'),
                  Feeling(),
                  CustomDivider(),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        checkList1.length,
                        (index) => CheckboxListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          controlAffinity: ListTileControlAffinity.trailing,
                          dense: true,
                          title: Text(checkList1[index]["title"],
                              style: kQuestionDescStyle),
                          value: checkList1[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkList1) {
                                element["value"] = false;
                              }
                              checkList1[index]["value"] = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  CustomDivider(),
                  Container(
                    width: 250.0,
                    child: Column(
                      children: [
                        SliderWidgetText(text: 'How good is the day today?'),
                        CustomSlider(),
                        SliderWidgetText(text: 'How good is the day today?'),
                        CustomSlider(),
                        SliderWidgetText(
                          text: 'How much is the workload manageable today?',
                        ),
                        CustomSlider(),
                        SliderWidgetText(
                          text:
                              'How much are you motivated to do something new today?',
                        ),
                        CustomSlider(),
                      ],
                    ),
                  ),
                  CustomDivider(),
                  Heading(text: 'Quick Checklist'),
                  Container(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(
                        checkList2.length,
                        (index) => CheckboxListTile(
                          contentPadding:
                              const EdgeInsets.symmetric(horizontal: 15.0),
                          visualDensity:
                              VisualDensity(horizontal: 0, vertical: -4),
                          controlAffinity: ListTileControlAffinity.trailing,
                          dense: true,
                          title: Text(checkList2[index]["title"],
                              style: kQuestionDescStyle),
                          value: checkList2[index]["value"],
                          onChanged: (value) {
                            setState(() {
                              for (var element in checkList2) {
                                element["value"] = false;
                              }
                              checkList2[index]["value"] = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Heading(text: 'Note to Self'),
                  Notepad(),
                  Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 60.0,
                        vertical: 10.0,
                      ),
                      child: CustomTile(text: 'Save', newScreen: HomeScreen())),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget CustomSlider() {
    return Slider(
      min: 0,
      max: 100,
      value: _value,
      activeColor: Colors.purple,
      inactiveColor: Colors.grey,
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      },
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: Colors.grey,
      thickness: 1.5,
    );
  }
}

class Emotion extends StatelessWidget {
  const Emotion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: double.infinity,
      // height: 140.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,

        child: Row(
          children: [
            EmojiWidget(
                assetName: 'assets/images/emojis/happy.png', label: 'Happy'),
            EmojiWidget(
                assetName: 'assets/images/emojis/sad.png', label: 'Sad'),
            EmojiWidget(
                assetName: 'assets/images/emojis/disgusted.png',
                label: 'Disgusted'),
            EmojiWidget(
                assetName: 'assets/images/emojis/fear.png', label: 'Fear'),
            EmojiWidget(
                assetName: 'assets/images/emojis/surprise.png',
                label: 'Surprise'),
            EmojiWidget(
                assetName: 'assets/images/emojis/happy.png', label: 'Angry'),
          ],
        ),
      ),
    );
  }
}

class Feeling extends StatelessWidget {
  const Feeling({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            EmojiWidget(
                assetName: 'assets/images/emojis/loved.png', label: 'Loved'),
            EmojiWidget(
                assetName: 'assets/images/emojis/proud.png', label: 'Proud'),
            EmojiWidget(
                assetName: 'assets/images/emojis/excited.png',
                label: 'Excited'),
            EmojiWidget(
                assetName: 'assets/images/emojis/satisfied.png',
                label: 'Satisfied'),
            EmojiWidget(
                assetName: 'assets/images/emojis/confused.png',
                label: 'Confused'),
            EmojiWidget(
                assetName: 'assets/images/emojis/happy.png', label: 'Happy'),
          ],
        ),
      ),
    );
  }
}

class Heading extends StatelessWidget {
  const Heading({
    Key? key,
    required this.text,
  }) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        text,
        style: kQuestionTextStyle,
      ),
    );
  }
}

class EmojiWidget extends StatelessWidget {
  const EmojiWidget({Key? key, required this.assetName, required this.label})
      : super(key: key);
  final String assetName;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Image.asset(assetName, height: 60.0),
        ),
        Text(label),
      ],
    );
  }
}

class SliderWidgetText extends StatelessWidget {
  const SliderWidgetText({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: kQuestionDescStyle,
    );
  }
}

class Notepad extends StatelessWidget {
  const Notepad({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: TextFormField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: appColor, width: 2.0),
          ),
          fillColor: Colors.white,
          hintText: 'Enter your note here',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(
              color: Colors.black,
              width: 2.0,
            ),
          ),
        ),
        validator: (val) {
          if (val!.length == 0) {
            return "Note cannot be empty";
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.multiline,
        maxLines: 6,
      ),
    );
  }
}
