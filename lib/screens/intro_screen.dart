import 'package:firebase_auth/firebase_auth.dart';

// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:fluttermoji/fluttermoji.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rehnuma/appvariables.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/mixins.dart';
import 'package:rehnuma/screens/personalize_space.dart';
import 'package:rehnuma/screens/signin_screen.dart';
import 'package:rehnuma/widgets/upper_portion.dart';
import 'package:rehnuma/widgets/choose_avatar.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';
import 'package:rehnuma/widgets/goal_cards.dart';

import '../controllers/auth_controller.dart';
import '../navigation screens/home.dart';
import '../widgets/gender_widget.dart';

final nameController = TextEditingController();
final pwdController = TextEditingController();
final emailController = TextEditingController();
final nameFormKey = GlobalKey<FormState>();
final emailFormKey = GlobalKey<FormState>();

String? emailValidator(value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = RegExp(pattern.toString());
  if (!regExp.hasMatch(value)) {
    return 'Email format is invalid';
  } else {
    return null;
  }
}

String? pwdValidator(password) {
  if (password.isEmpty) {
    return 'Please enter password';
  } else if (password.length < 6) {
    return 'Password length must be at least 6 characters';
  } else {
    return null;
  }
}

DateTime selectedDate = DateTime.now();

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
          color: Colors.transparent),
      margin: const EdgeInsets.only(
        top: 30.0,
        left: 20.0,
        right: 20.0,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
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

class _IntroScreenState extends State<IntroScreen> with ProgressSpin, GetSnack {
  late FluttermojiController fluttermojiController;
  int widgetCount = 0;
  int progressBarIndex = 1;
  final formKey = GlobalKey<FormState>();
  late AuthController authController;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef = FirebaseDatabase.instance.ref().child("Users");
  final widgetList = [
    CenterWidget(
      height: 250.0,
      question: 'First Things First!!!',
      questionDesc: 'What should we call you?',
      acutalWidget: Form(
        key: nameFormKey,
        child: CustomTextField(
          hint: 'TYPE YOUR NAME',
          inputType: TextInputType.name,
          myController: nameController,
        ),
      ),
    ),
    CenterWidget(
      height: 300.0,
      question: 'SALAM!',
      questionDesc: 'What\'s your email?',
      acutalWidget: Form(
          key: emailFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              CustomTextField(
                hint: 'TYPE YOUR EMAIL',
                inputType: TextInputType.emailAddress,
                myController: emailController,
                validator: emailValidator,
              ),
              SizedBox(
                height: 20,
              ),
              CustomTextField(
                hint: 'TYPE YOUR PASSWORD',
                inputType: TextInputType.name,
                myController: pwdController,
                validator: pwdValidator,
                password: true,
              ),
            ],
          )),
    ),
    CenterWidget(
      height: 350.0,
      question: 'When were you born?',
      questionDesc: 'Knowing this will help us make REHNUMA better for you',
      acutalWidget: DatePickerWidget(
        looping: false,
        // default is not looping
        firstDate: DateTime(1990, 01, 01),
        lastDate: DateTime.now(),
        initialDate: DateTime.now(),
        dateFormat: "dd-MMM-yyyy",
        locale: DatePicker.localeFromString('en'),
        onChange: (DateTime newDate, _) => selectedDate = newDate,
        pickerTheme: DateTimePickerTheme(
          backgroundColor: Colors.transparent,
          itemTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 25.0,
            fontWeight: FontWeight.w700,
          ),
          dividerColor: Color(0xff742d74),
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
      height: 450,
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

  @override
  void initState() {
    super.initState();
    fluttermojiController = FluttermojiController();
    fluttermojiController.init();
    authController = Get.put(AuthController());
  }

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
              title: Text("Credentials are not valid:("),
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
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
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
      body: Container(
        decoration: BoxDecoration(
          image:
              DecorationImage(image: AssetImage(bgImage2), fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            child: Obx(() {
              return Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Form(
                          key: formKey,
                          child: widgetList[widgetCount],
                        ),
                        widgetCount == 5
                            ? GestureDetector(
                                onTap: () async {
                                  if (AppVariables.imageString == "") {
                                    setState(() {
                                      AppVariables.imageString =
                                          fluttermojiController
                                              .fluttermoji.value;
                                    });
                                  }
                                  final userMap = {
                                    'email': emailController.text,
                                    'name': nameController.text,
                                    'gender': AppVariables.selectedGender,
                                    'goal': AppVariables.selectedGoal,
                                    'date': selectedDate,
                                    'emoji': AppVariables.imageString
                                    // 'uid' : AppVariables.auth.,
                                  };
                                  var done = await authController
                                      .signUpWithEmailAndPassword(
                                          emailController.text,
                                          pwdController.text,
                                          userMap);
                                  if (done.toString() == "success") {
                                    print("here");
                                    showSnackBar(
                                        title: "Register",
                                        msg: "Successfully Registered");
                                    Get.offAll(SignInScreen());
                                  } else {
                                    print("here");
                                    showSnackBar(
                                        title: "Failed", msg: done.toString());
                                  }
                                },
                                child: Container(
                                  width: Get.width * 0.5,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 22.0,
                                    vertical: 15.0,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kElevatedButtonColor,
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Register",
                                      style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Container()
                      ],
                    ),
                  ),
                  (authController.isLoading.value)
                      ? Container(
                          height: Get.height,
                          width: Get.width,
                          color: Colors.white.withOpacity(0.5),
                          child: Center(child: showProgress()))
                      : Container()
                ],
              );
            }),
          ),
        ),
      ),
      floatingActionButton: widgetCount == 5
          ? null
          : FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios),
              backgroundColor: Colors.white,
              foregroundColor: Colors.black,
              onPressed: () {
                bool nextPage = true;
                if (widgetCount == 0) {
                  if (!nameFormKey.currentState!.validate()) {
                    nextPage = false;
                  }
                }
                if (widgetCount == 1) {
                  if (!emailFormKey.currentState!.validate()) {
                    nextPage = false;
                  }
                }
                if (widgetCount == 3) {
                  if (AppVariables.selectedGender == "") {
                    nextPage = false;
                  }
                }
                if (widgetCount == 4) {
                  if (AppVariables.selectedGoal == "") {
                    nextPage = false;
                  }
                }
                if (nextPage) {
                  setState(() {
                    if (widgetCount < 5 && progressBarIndex < 6) {
                      progressBarIndex++;
                      widgetCount++;
                    } else if (widgetCount == 5 && progressBarIndex == 6) {
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
                }
              },
            ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false,
    );
  }
}
