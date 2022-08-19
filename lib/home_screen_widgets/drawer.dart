import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/controllers/auth_controller.dart';
import 'package:rehnuma/screens/about_us.dart';
import 'package:share_plus/share_plus.dart';
import 'package:feedback/feedback.dart';
import 'package:path_provider/path_provider.dart';

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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * .12,
                        width: MediaQuery.of(context).size.width * .5,
                        decoration: BoxDecoration(
                            color: Colors.teal, shape: BoxShape.circle),
                        child: Center(
                          child: SvgPicture.string(
                            AppVariables.box.read("image"),
                            fit: BoxFit.fill,
                            height: MediaQuery.of(context).size.height * .12,
                            width: MediaQuery.of(context).size.width * .5,
                          ),
                        ),
                      ),
                      Text(
                        AppVariables.box.read("name"),
                        style: kQuestionDescStyle,
                        overflow: TextOverflow.ellipsis,
                        // textAlign: TextAlign.center,
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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AboutUsScreen(),
                  ),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.share),
              title: Text(
                'Share REHNUMA',
                style: kQuestionDescStyle,
              ),
              onTap: () {
                Share.share(
                  "Check out our app on Github https://github.com/HusnaJaved241/rehnuma1",
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text(
                'Feedback',
                style: kQuestionDescStyle,
              ),
              onTap: () {
                BetterFeedback.of(context).show((p0) async {
                  Uint8List imageInUnit8List = p0.screenshot;
                  final tempDir = await getTemporaryDirectory();
                  File file = await File('${tempDir.path}/image.png').create();
                  file.writeAsBytesSync(imageInUnit8List);
                  final Email email = Email(
                    body: p0.text,
                    subject: 'REHNUMA Feedback',
                    recipients: ['husna.bsse3670@iiu.edu.pk', 'maham.bsse3666@iiu.edu.pk'],
                    // cc: ['cc@example.com'],
                    // bcc: ['bcc@example.com'],
                    attachmentPaths: ['${tempDir.path}/image.png'],
                    isHTML: false,
                  );

                  await FlutterEmailSender.send(email);
                  // Share.shareFiles(
                  //   ['${tempDir.path}/image.png'],
                  //   text: p0.text,
                  // );
                });
              },
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
