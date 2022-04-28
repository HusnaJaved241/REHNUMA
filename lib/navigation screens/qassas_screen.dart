import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/search_bar.dart';
import 'package:rehnuma/screens/home_screen.dart';

import '../constants.dart';
import 'dua_screen.dart';

class QassasScreen extends StatelessWidget {
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: appColor,
          appBar: AppBar(
            title: Text(
              'Qassa-ul-Anbiya',
              style: (kQuestionDescStyle),
            ),
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
                  builder: (context) => HomeScreen(),
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: SearchBar(
                          focusNode: focusNode,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Text('All'),
                            Icon(
                              Icons.expand_more_rounded,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 10.0,
                  ),
                  height: (MediaQuery.of(context).size.height),
                  child: ListView(
                    children: [
                      CustomTile(),
                      CustomTile(),
                      CustomTile(),
                      CustomTile(),
                      CustomTile(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}