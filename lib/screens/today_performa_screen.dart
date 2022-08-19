import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rehnuma/controllers/performa_controller.dart';
import 'package:rehnuma/models/performa_model.dart';
import 'package:rehnuma/models/questions_model.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'dart:async';

import '../constants.dart';
import '../mixins.dart';

class TodayPerformaScreen extends StatefulWidget {
  @override
  State<TodayPerformaScreen> createState() => _TodayPerformaScreenState();
}

class _TodayPerformaScreenState extends State<TodayPerformaScreen>
    with ProgressSpin, GetSnack {
  FocusNode focusNode = FocusNode();
  final _dateFormatter = DateFormat('d');
  final _monthFormatter = DateFormat('MMM');
  Completer<PDFViewController> _pdfViewController =
      Completer<PDFViewController>();
  StreamController<String> _pageCountController = StreamController<String>();

  String getDateDay(DateTime dateTime) {
    dynamic date = _dateFormatter.format(dateTime);
    final month = _monthFormatter.format(dateTime);
    return '$date $month';
  }

  String emotion = '';
  String feeling = '';
  String noteToYourSelf = '';
  final firestoreInstance = FirebaseFirestore.instance;
  List<QuestionModel> sliderQuestion = [
    QuestionModel(question: "How good is the day today?", answer: 0.0),
    QuestionModel(question: "How good is the day today?", answer: 0.0),
    QuestionModel(
        question: "How much is the workload manageable today?", answer: 0.0),
    QuestionModel(
        question: "How much are you motivated to do something new today?",
        answer: 0.0),
  ];

  List<QuestionModel> quickCheckList = [
    QuestionModel(question: "Prayed 5 times", answer: false),
    QuestionModel(question: "Recited Quran", answer: false),
    QuestionModel(question: "Avoided Backbiting", answer: false),
    QuestionModel(question: "Showed patience", answer: false),
    QuestionModel(question: "Had the best of Ikhlaaq", answer: false),
  ];

  List<QuestionModel> checkList = [
    QuestionModel(question: "Did you sleep properly today?", answer: false),
    QuestionModel(question: "Did you eat properly today?", answer: false),
    QuestionModel(question: "Did you go for walk today?", answer: false),
    QuestionModel(
        question: "Did you spend some time for relaxation today?",
        answer: false),
  ];

  Future<void> _addData() async {
    if (emotion == '') {
      showSnackBar(title: "Emotion", msg: "Please select today's emotion");
    } else if (feeling == '') {
      showSnackBar(title: "Feeling", msg: "Please select today's feeling");
    } else if (noteToYourSelf.isEmpty) {
      showSnackBar(
          title: "Note to yourself", msg: "Please write a note to yourself");
    } else {
      DateTime dateTime = DateTime.now();
      PerformaModel performaModel = PerformaModel(
          emotion: emotion,
          feeling: feeling,
          noteToYourSelf: noteToYourSelf,
          questions: checkList,
          sliderQuestions: sliderQuestion,
          quickCheckList: quickCheckList,
          uid: FirebaseAuth.instance.currentUser!.uid,
          date: getDateDay(dateTime),
          dateTime: Timestamp.fromDate(dateTime));

      String success = await performaController.uploadPerforma(performaModel);
      if (success == 'success') {
        performaController.getAllPerformas();
        // the emotion based suggestional pop-up should be appeared here.
        var currentWidth = MediaQuery.of(context).size.width;
        var currentHeight = MediaQuery.of(context).size.height;
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                contentPadding: const EdgeInsets.all(0.0),
                insetPadding: EdgeInsets.symmetric(
                  horizontal: currentWidth * 0.02,
                  vertical: currentHeight * 0.08,
                ),
                content: SizedBox(
                  height: currentHeight * 0.58,
                  width: currentWidth,
                  child: Stack(
                    children: [
                     PDF(
                    pageFling: false,
                    fitEachPage: true,
                    onPageChanged: (int? current, int? total) => _pageCountController
                        .add('${current! + 1} - $total'),
                    onViewCreated: (PDFViewController pdfViewController) async {
                      _pdfViewController.complete(pdfViewController);
                      final int currentPage =
                          await pdfViewController.getCurrentPage() ?? 0;
                      final int? pageCount =
                          await pdfViewController.getPageCount();
                      _pageCountController
                          .add('${currentPage + 1} - $pageCount');
                    },
                  ).fromAsset(
                    "assets/pop_up/angry.pdf",
                    errorWidget: (dynamic error) =>
                        Center(child: Text(error.toString())),
                  ),
                      Positioned(
                        right: 0,
                        child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.close,
                            color: Colors.purple,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            });
        Navigator.pop(context);
      }
    }
  }

  late PerformaController performaController;

  @override
  void initState() {
    performaController = Get.put(PerformaController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          GestureDetector(
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
                          child: Text(
                            'How are you feeling?',
                            style: TextStyle(fontSize: 30.0),
                          ),
                        ),
                        CustomDivider(),
                        Heading(text: 'Emotion'),
                        Emotion(
                          onTap: (val) {
                            setState(() {
                              emotion = val;
                            });
                          },
                          selectedEmotion: emotion,
                        ),
                        CustomDivider(),
                        Heading(text: 'Feeling'),
                        Feeling(
                          selectedFeeling: feeling,
                          onTap: (v) {
                            setState(() {
                              feeling = v;
                            });
                          },
                        ),
                        CustomDivider(),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              checkList.length,
                              (index) => CustomCheckListTile(
                                titleText: checkList[index].question,
                                valueBool: checkList[index].answer,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      checkList[index].answer = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        CustomDivider(),
                        Container(
                          width: 250.0,
                          child: Column(
                            children:
                                List.generate(sliderQuestion.length, (index) {
                              return Column(
                                children: [
                                  SliderWidgetText(
                                    text: sliderQuestion[index].question,
                                  ),
                                  Slider(
                                    min: 0,
                                    max: 100,
                                    value: sliderQuestion[index].answer,
                                    activeColor: Colors.purple,
                                    inactiveColor: Colors.grey,
                                    onChanged: (value) {
                                      setState(() {
                                        sliderQuestion[index].answer = value;
                                      });
                                    },
                                  ),
                                ],
                              );
                            }),
                          ),
                        ),
                        CustomDivider(),
                        Heading(text: 'Quick Checklist'),
                        Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: List.generate(
                              quickCheckList.length,
                              (index) => CustomCheckListTile(
                                titleText: quickCheckList[index].question,
                                valueBool: quickCheckList[index].answer,
                                onChanged: (value) {
                                  if (value != null) {
                                    setState(() {
                                      quickCheckList[index].answer = value;
                                    });
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                        Heading(text: 'Note to Self'),
                        Notepad(
                          onChanged: (v) {
                            setState(() {
                              noteToYourSelf = v;
                            });
                          },
                        ),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 60.0,
                              vertical: 10.0,
                            ),
                            child:
                                CustomTile(text: 'Save', newScreen: _addData)),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          if (performaController.isLoading.value)
            Container(
              height: Get.height,
              width: Get.width,
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: showProgress(),
              ),
            )
        ],
      );
    });
  }
}

class CustomCheckListTile extends StatefulWidget {
  CustomCheckListTile({
    Key? key,
    required this.titleText,
    required this.valueBool,
    required this.onChanged,
  }) : super(key: key);
  String titleText;
  bool valueBool;
  final Function(bool?) onChanged;

  @override
  State<CustomCheckListTile> createState() => _CustomCheckListTileState();
}

class _CustomCheckListTileState extends State<CustomCheckListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 15.0),
      visualDensity: VisualDensity(horizontal: 0, vertical: -4),
      controlAffinity: ListTileControlAffinity.trailing,
      checkColor: Color(0xFFAF1106),
      activeColor: Color.fromARGB(255, 11, 54, 90),
      side: BorderSide(
        width: 2.0,
        color: Color.fromARGB(255, 11, 54, 90),
      ),
      dense: true,
      title: Text(widget.titleText, style: kQuestionDescStyle),
      value: widget.valueBool,
      onChanged: widget.onChanged,
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
    required this.onTap,
    required this.selectedEmotion,
  }) : super(key: key);
  final Function(String) onTap;
  final String selectedEmotion;

  @override
  Widget build(BuildContext context) {
    bool getSelected(String path) {
      List<String> list = path.split('/');
      String file = list.last.split('.')[0];
      return file == selectedEmotion;
    }

    return Container(
      // width: double.infinity,
      // height: 140.0,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/happy.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/happy.png'),
                  assetName: 'assets/images/emojis/happy.png',
                  label: 'Happy'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/sad.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/sad.png'),
                  assetName: 'assets/images/emojis/sad.png',
                  label: 'Sad'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list =
                    'assets/images/emojis/disgusted.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/disgusted.png'),
                  assetName: 'assets/images/emojis/disgusted.png',
                  label: 'Disgusted'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/fear.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/fear.png'),
                  assetName: 'assets/images/emojis/fear.png',
                  label: 'Fear'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list =
                    'assets/images/emojis/surprise.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/surprise.png'),
                  assetName: 'assets/images/emojis/surprise.png',
                  label: 'Surprise'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/angry.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/angry.png'),
                  assetName: 'assets/images/emojis/angry.png',
                  label: 'Angry'),
            ),
          ],
        ),
      ),
    );
  }
}

class Feeling extends StatelessWidget {
  const Feeling({
    Key? key,
    required this.onTap,
    required this.selectedFeeling,
  }) : super(key: key);
  final Function(String) onTap;
  final String selectedFeeling;

  @override
  Widget build(BuildContext context) {
    bool getSelected(String path) {
      List<String> list = path.split('/');
      String file = list.last.split('.')[0];
      return file == selectedFeeling;
    }

    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/loved.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/loved.png'),
                  assetName: 'assets/images/emojis/loved.png',
                  label: 'Loved'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/proud.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/proud.png'),
                  assetName: 'assets/images/emojis/proud.png',
                  label: 'Proud'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list =
                    'assets/images/emojis/excited.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/excited.png'),
                  assetName: 'assets/images/emojis/excited.png',
                  label: 'Excited'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list =
                    'assets/images/emojis/satisfied.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/satisfied.png'),
                  assetName: 'assets/images/emojis/satisfied.png',
                  label: 'Satisfied'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list =
                    'assets/images/emojis/confused.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/confused.png'),
                  assetName: 'assets/images/emojis/confused.png',
                  label: 'Confused'),
            ),
            GestureDetector(
              onTap: () {
                List<String> list = 'assets/images/emojis/happy.png'.split('/');
                String file = list.last.split('.')[0];
                onTap(file);
              },
              child: EmojiWidget(
                  selected: getSelected('assets/images/emojis/happy.png'),
                  assetName: 'assets/images/emojis/happy.png',
                  label: 'Happy'),
            ),
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
  const EmojiWidget(
      {Key? key,
      required this.assetName,
      required this.label,
      this.selected = false})
      : super(key: key);
  final String assetName;
  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8.0),
          child: Image.asset(assetName, height: 60.0),
        ),
        Text(
          label,
          style:
              TextStyle(color: selected ? Colors.yellowAccent : Colors.black),
        ),
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

class Notepad extends StatefulWidget {
  const Notepad({Key? key, required this.onChanged, this.text = ''})
      : super(key: key);
  final Function(String) onChanged;
  final String text;

  @override
  State<Notepad> createState() => _NotepadState();
}

class _NotepadState extends State<Notepad> {
  TextEditingController textEditingController = TextEditingController();
  @override
  void initState() {
    if (widget.text.isNotEmpty) {
      textEditingController.text = widget.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: appColor, width: 2.0),
          ),
          enabled: widget.text.isEmpty,
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
        onChanged: widget.onChanged,
      ),
    );
  }
}
