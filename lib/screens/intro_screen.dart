import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/screens/personalize_space.dart';
import 'package:rehnuma/widgets/upper_portion.dart';
import 'package:rehnuma/widgets/choose_avatar.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';
import 'package:rehnuma/widgets/goal_cards.dart';

import '../navigation screens/home.dart';
import '../widgets/gender_widget.dart';

final nameController = TextEditingController();
final emailController = TextEditingController();
DateTime selectedDate = DateTime.now();
final widgetList = [
  CenterWidget(
    height: 250.0,
    question: 'First Things First!!!',
    questionDesc: 'What should we call you?',
    acutalWidget: CustomTextField(
      hint: 'TYPE YOUR NAME',
      inputType: TextInputType.name,
      myController: nameController,
    ),
  ),
  CenterWidget(
    height: 250.0,
    question: 'SALAM username!',
    questionDesc: 'What\'s your email?',
    acutalWidget: CustomTextField(
      hint: 'TYPE YOUR EMAIL',
      inputType: TextInputType.emailAddress,
      myController: emailController,
    ),
  ),
  CenterWidget(
    height: 350.0,
    question: 'When were you born?',
    questionDesc: 'Knowing this will help us make REHNUMA better for you',
    acutalWidget: DatePickerWidget(
      looping: false, // default is not looping
      firstDate: DateTime(1990, 01, 01),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      dateFormat: "dd-MMM-yyyy",
      locale: DatePicker.localeFromString('en'),
      onChange: (DateTime newDate, _) => selectedDate = newDate,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: appColor,
        itemTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
        dividerColor: Color(0xffebc014),
      ),
    ),
  ),
  CenterWidget(
    height: 400.0,
    question: 'How do you identify?',
    questionDesc: 'Knowing your gender help us give you better visuals',
    acutalWidget: GenderWidget(),
  ),
  CenterWidget(
    height: 500.0,
    question: 'Long-term Goal',
    questionDesc: 'What would you like to improve in your life?',
    acutalWidget: GoalCards(),
  ),
  CenterWidget(
    height: 500.0,
    question: 'Hey, good looking!',
    questionDesc: 'Customizing your avatar makes REHNUMA fun',
    acutalWidget: ChooseAvatar(),
  ),
];

class CenterWidget extends StatelessWidget {
  final String question;
  final String questionDesc;
  final Widget acutalWidget;
  final double height;
  const CenterWidget({
    Key? key,
    required this.question,
    required this.questionDesc,
    required this.acutalWidget,
    required this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          20.0,
        ),
        color: appColor,
      ),
      margin: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 120.0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  question,
                  textAlign: TextAlign.center,
                  style: kQuestionTextStyle,
                ),
                Text(
                  questionDesc,
                  textAlign: TextAlign.center,
                  style: kQuestionDescStyle,
                ),
              ],
            ),
          ),
          acutalWidget,
        ],
      ),
    );
  }
}

class IntroScreen extends StatefulWidget {
  // final widgetListCount;
  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  int widgetCount = 0;
  int progressBarIndex = 1;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("Users");

  void registerToFirebase() {
    firebaseAuth
        .createUserWithEmailAndPassword(
      email: emailController.text,
      password: nameController.text,
    )
        .then((result) {
      dbRef.child(result.user!.uid).set({
        "email": emailController.text,
        "name": nameController.text,
        "date": selectedDate,
        "gender": GenderWidget().gender,
        "goal": GoalCards().goal,
        // IMPORTANT: deeply analyze fluttermoji example from github... and use of FluttermojiSaveWidget()
        // "dp": ChooseAvatar().saveDp() 
      }).then((res) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: ((context) => Home()),
          ),
          // MaterialPageRoute(builder: (context) => Home(uid: result.user!.uid)),
        );
      });
    }).catchError((err) {
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                TextButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widgetCount > 0 && progressBarIndex > 1) {
                        widgetCount--;
                        progressBarIndex--;
                      } else if (widgetCount <= 0 && progressBarIndex <= 1) {
                        Navigator.pop(context);
                      }
                    });
                  },
                  child: Icon(
                    Icons.arrow_back_outlined,
                    color: Colors.black,
                    size: 30.0,
                  ),
                ),
                UpperPortion(
                  progressBarIndex,
                ),
              ],
            ),
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
              Form(
                key: formKey,
                child: widgetList[widgetCount],
              ),
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
              if (formKey.currentState!.validate()) {
                registerToFirebase();
              }
              print('registered to fireabse');
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PersonalizeApp(),
                ),
              );
            } else if (widgetCount > 5 && progressBarIndex > 6) {
              widgetCount--;
              progressBarIndex--;
              if (formKey.currentState!.validate()) {
                registerToFirebase();
              }
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
