import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/controllers/auth_controller.dart';
import 'package:rehnuma/mixins.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';
import 'package:rehnuma/widgets/elevated_button.dart';

import '../appvariables.dart';
import '../models/user_model.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with WidgetsBindingObserver, ProgressSpin, GetSnack {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final bool _success = false;
  late String _userEmail = "";
  final String _userID = "";
  FirebaseAuth _auth = FirebaseAuth.instance;
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

  late AuthController authController;

  @override
  void initState() {
    authController = Get.put(AuthController());
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _pwdController.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      try {
        FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) {
          final Uri? deepLink = dynamicLink.link;
          if (deepLink != null) {
            handleLink(deepLink, _emailController.text);
            FirebaseDynamicLinks.instance.onLink.listen((dynamicLink) {
              final Uri? deepLink = dynamicLink.link;
              handleLink(deepLink!, _emailController.text);
            }, onError: (e) async {
              print(e.message);
            });
          }
        }, onError: (e) async {
          print(e.message);
        });

        final PendingDynamicLinkData? data =
            await FirebaseDynamicLinks.instance.getInitialLink();
        final Uri? deepLink = data?.link;
        print('deepLink :: $deepLink');
      } catch (e) {
// you can print this error as well
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(bgImage2),
                fit: BoxFit.cover
              ),
            ),
            child: SafeArea(
              child: GestureDetector(
                onTap: () {
                  FocusManager.instance.primaryFocus!.unfocus();
                },
                child: Scaffold(
                  backgroundColor: Colors.transparent,
                  body: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 20.0,
                          ),
                          child: Text(
                            'Sign In',
                            style: kQuestionTextStyle,
                          ),
                        ),
                        CustomTextField(
                          hint: 'Email',
                          inputType: TextInputType.emailAddress,
                          myController: _emailController,
                          validator: emailValidator,
                        ),
                        CustomTextField(
                          hint: 'Password',
                          inputType: TextInputType.name,
                          myController: _pwdController,
                          validator: pwdValidator,
                          password: true,
                        ),
                        CustomElevatedButton(
                          btnName: 'Continue',
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              FocusManager.instance.primaryFocus?.unfocus();
                              var user = await authController
                                  .signInWithEmailAndPassword(
                                      _emailController.text,
                                      _pwdController.text);

                              if (user.runtimeType == User) {
                                AppVariables.box.write("uid", user.uid);
                                print(AppVariables.box.read("uid").toString());
                                var userData = await authController
                                    .getUsersByEmail(_emailController.text);
                                if (userData.runtimeType == UserModel) {
                                  Get.offAllNamed("/");
                                } else {
                                  showSnackBar(
                                      title: "Login", msg: user.toString());
                                }
                              } else {
                                showSnackBar(
                                    title: "Error", msg: "Error: $user");
                              }
                            }
                          },
                        ),
                        CustomElevatedButton(
                          btnName: 'Signup',
                          onPressed: () async {
                            Get.toNamed("/register");
                          },
                        ),
                        // Container(
                        //   alignment: Alignment.center,
                        //   padding: const EdgeInsets.symmetric(horizontal: 16),
                        //   child: Text(
                        //     _success == null
                        //         ? ''
                        //         : (_success
                        //             ? 'Successfully signed in, uid: ' + _userID
                        //             : 'Sign in failed'),
                        //     style: TextStyle(color: Colors.red),
                        //   ),
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          (authController.isLoading.value)
              ? Container(
                  height: Get.height,
                  width: Get.width,
                  color: Colors.white.withOpacity(0.5),
                  child: Center(
                    child: showProgress(),
                  ),
                )
              : Container()
        ],
      );
    });
  }

  Future<void> signInWithEmailAndLink({required String userEmail}) async {
    var _userEmail = userEmail;
    var acs = ActionCodeSettings(
        url: "https://rehnuma1.page.link/bjYi",
        handleCodeInApp: true,
        androidPackageName: "com.example.rehnuma",
        androidMinimumVersion: "12");
    try {
      return await _auth.sendSignInLinkToEmail(
          email: _userEmail, actionCodeSettings: acs);
    } on FirebaseAuthException catch (e) {}
  }

  void handleLink(Uri link, userEmail) async {
    if (link != null) {
      final UserCredential user =
          await FirebaseAuth.instance.signInWithEmailLink(
        email: userEmail,
        emailLink: link.toString(),
      );
    } else {
      print(" link is null");
    }
  }
}
