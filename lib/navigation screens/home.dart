import 'package:flutter/material.dart';
import '../constants.dart';
import '../home_screen_widgets/home_page_body.dart';
import '../home_screen_widgets/search_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: Icon(
              Icons.menu, // add custom icons also
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          actions: [
            SearchBar(
              focusNode: focusNode,
            ),
          ],
        ),
        body: Container(
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              // have to fix the expanded widget in this way this is not gonna work
              // will have to ask someone how to fix this
              // leave this for now
              Expanded(
                child: Column(
                  children: [
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      flex: 2,
                      child: HomeCard(
                        // height: 115.0,
                        child: Card1(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: HomeCard(
                        // height: 160.0,
                        child: Card2(),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: HomeCard(
                        // height: 185.0,
                        child: Card3(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}