import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/home_screen_widgets/drawer.dart';
import 'package:rehnuma/navigation%20screens/home.dart';
import 'package:rehnuma/navigation%20screens/salah_traker_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

final List<Widget> _tabItems = [
  SalahTrackerScreen(),
  Home(),
  MoreScreen(),
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 1;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  // TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBody: true,
      drawer: BuildDrawer(),
      backgroundColor: appColor,
      body: _tabItems[_page],
      bottomNavigationBar: CurvedNavigationBar(
        
        index: _page,
        height: 47.0,
        items: <Widget>[
          bottomItem(
            index: 0,
            image: 'assets/images/praying_man.png',
          ),
          bottomItem(
            index: 1,
            image: 'assets/images/home.png',
          ),
          bottomItem(
            index: 2,
            image: 'assets/images/more_options.png',
          ),
        ],
        color: Colors.white24,
        buttonBackgroundColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
    );
  }

  Widget bottomItem(
      {required int index, required String image}) {
    if (index == _page) {
      return Image.asset(
        image,
        height: 20.0,
      );
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Image.asset(
              image,
              height: 30.0,
            ),
      );
    }
  }
}
