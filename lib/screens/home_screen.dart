import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';
import 'package:rehnuma/home_screen_widgets/drawer.dart';
import 'package:rehnuma/navigation%20screens/home.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';
import 'package:rehnuma/navigation%20screens/qassas_screen.dart';
import 'package:rehnuma/navigation%20screens/salah_traker_screen.dart';
import 'package:rehnuma/navigation%20screens/therapy_screen.dart';

final List<Widget> _tabItems = [
  DuaScreen(),
  SalahTrackerScreen(),
  Home(),
  TherapyScreen(),
  QassasScreen()
];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _page = 2;
  // GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  // TextEditingController searchController = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: BuildDrawer(),
      backgroundColor: appColor,
      body: _tabItems[_page],
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        height: 60.0,
        items: <Widget>[
          bottomItem(title: "Dua", index: 0, image: 'assets/images/dua.png',
),
          bottomItem(title: "Tracker", index: 1, image: 'assets/images/prayer_tracker.png',
),
          bottomItem(title: "Home", index: 2, image: 'assets/images/home.png',
),
          bottomItem(title: "Therapies", index: 3, image: 'assets/images/therapy1.png',
),
          bottomItem(
              title: "Qassas", index: 4, image:  'assets/images/qassas.png',
),
        ],
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
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
      {required int index, required String title, required String image}) {
    if (index == _page) {
      return Image.asset(image, height: 30.0,);
    } else {
      return Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 35.0,),
            const SizedBox(height: 5),
            Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.black),
            )
          ],
        ),
      );
    }
  }
}
