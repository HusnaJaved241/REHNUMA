import 'package:flutter/material.dart';
import 'package:rehnuma/home_screen_widgets/search_bar.dart';
import 'package:rehnuma/screens/home_screen.dart';
import '../constants.dart';

class DuaScreen extends StatelessWidget {
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
              'Dua',
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
            actions: [
              SearchBar(
                focusNode: focusNode,
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
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

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(child: Text('First Dua')),
      color: Colors.green[300],
      height: 50.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
    );
  }
}
