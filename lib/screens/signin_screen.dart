import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/widgets/custom_text_field.dart';
import 'package:rehnuma/widgets/elevated_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with WidgetsBindingObserver {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final bool _success = false;
   late  String _userEmail = "";
  final String _userID = "";
  FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    _emailController.dispose();
    WidgetsBinding.instance!.removeObserver(this);
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
    return Container(
      decoration: BoxDecoration(
        gradient: kLinearGradient,
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
                      vertical: 40.0,
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
                  ),
                  CustomElevatedButton(
                    btnName: 'Continue',
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        signInWithEmailAndLink(userEmail: _userEmail);
                      }
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      _success == null
                          ? ''
                          : (_success
                              ? 'Successfully signed in, uid: ' + _userID
                              : 'Sign in failed'),
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
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
