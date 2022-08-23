import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:rehnuma/models/therapy_model.dart';
import 'package:rehnuma/navigation%20screens/therapy_detail_screen.dart';
import 'package:rehnuma/screens/home_screen.dart';
import 'package:rehnuma/screens/more_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'dua_screen.dart';

class TherapyScreen extends StatefulWidget {
  @override
  State<TherapyScreen> createState() => _TherapyScreenState();
}

class _TherapyScreenState extends State<TherapyScreen> {
  FocusNode focusNode = FocusNode();

  List therapyList = therapiesList;
  List searchedTherapy = [];
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      searchedTherapy = therapyList;
    });
    super.initState();
  }

  searchString(String query) {
    if (query.isEmpty) {
      return;
    } else {
      setState(() {
        searchedTherapy = therapyList.where((element) {
          final name = element.name.toLowerCase();
          final input = query.toLowerCase();
          return name.contains(input);
        }).toList();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus!.unfocus(),
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          actions: [
            SearchBar(
              focusNode: focusNode,
              searchString: searchString,
            ),
          ],
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
                builder: (context) => MoreScreen(),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image:
                DecorationImage(image: AssetImage(bgImage), fit: BoxFit.cover),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 10.0,
                ),
                height: MediaQuery.of(context).size.height,
                child: CustomListView(
                  header: Container(
                    padding: const EdgeInsets.only(top: 7.0),
                    child: SelectableText(
                      'Psychological Therapies',
                      style: kQuestionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // shrinkWrap: true,
                  pageSize: 20,
                  padding: const EdgeInsets.only(bottom: 12.0),
                  itemBuilder: (context, index, dynamic item) {
                    return CustomTileTherapy(
                      text: searchedTherapy[index].name,
                      index: index,
                    );
                  },
                  itemCount: searchedTherapy.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTileTherapy extends StatelessWidget {
  const CustomTileTherapy({Key? key, required this.text, required this.index})
      : super(key: key);
  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => TherapyDetailScreen(
              index: index,
            ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: appColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 25.0),
            textAlign: TextAlign.center,
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.1,
        margin: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 5.0,
        ),
      ),
    );
  }
}
