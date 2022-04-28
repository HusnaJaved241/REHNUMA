import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
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
                        child: Image.asset('assets/images/user.png'),
                        radius: 52.0,
                      ),
                      Text(
                        'Username',
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
              title: Text(
                'Log Out',
                style: kQuestionDescStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
