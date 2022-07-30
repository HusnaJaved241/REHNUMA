import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/controllers/auth_controller.dart';

import '../appvariables.dart';

class BuildDrawer extends StatefulWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  State<BuildDrawer> createState() => _BuildDrawerState();
}

class _BuildDrawerState extends State<BuildDrawer> {
  late AuthController authController;
  // User? user = FirebaseAuth.instance.currentUser;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late User user;
  var userId;

  @override
  void initState() {
    // TODO: implement initState
    userId = _auth.currentUser!.uid;
    super.initState();

    authController = Get.put(AuthController());
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.68,
      backgroundColor: Color(0xffBE7FB0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(
                  bottom: Divider.createBorderSide(
                    context,
                    color: Colors.grey,
                    width: 1.5,
                  ),
                ),
              ),
              margin: const EdgeInsets.symmetric(vertical: 18.0),
              child: Container(
                width: 190.0,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      CircleAvatar(
                        child: Image.asset('assets/images/girl_avatar.jpg'),
                        radius: 52.0,
                      ),
                      Text(
                        'Name to be displayed here',
                        style: kQuestionDescStyle,
                      )
                    ],
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.info_outline_rounded),
              title: Text(
                'About us',
                style: kQuestionDescStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share REHNUMA',
                style: kQuestionDescStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text(
                'Feedback',
                style: kQuestionDescStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text(
                'Settings',
                style: kQuestionDescStyle,
              ),
            ),
            ListTile(
              leading: Icon(Icons.logout_outlined),
              onTap: () {
                authController.signOut();
              },
              title: Text(
                'Log Out',
                style: kQuestionDescStyle,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                top: 50.0,
              ),
              alignment: Alignment.bottomCenter,
              child: Image.asset(
                'assets/images/logo.png',
                height: 120.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
