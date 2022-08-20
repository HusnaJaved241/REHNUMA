import 'package:flutter/material.dart';
import 'package:listview_utils/listview_utils.dart';
import 'package:rehnuma/models/masnoon_duaen.dart';
import 'package:rehnuma/navigation%20screens/dua_screen.dart';

import '../constants.dart';
import '../home_screen_widgets/search_bar.dart';
import 'emotionbased_dua_screen.dart';

class MasnoonDuaScreen extends StatefulWidget {
  @override
  State<MasnoonDuaScreen> createState() => _MasnoonDuaScreenState();
}

class _MasnoonDuaScreenState extends State<MasnoonDuaScreen> {
  List masnoonDua = masnoonDuaList;
  List searchedSupplication = [];

  FocusNode focusNode = FocusNode();
  @override
  void initState() {
    setState(() {
      searchedSupplication = masnoonDua;
    });
    super.initState();
  }
  searchString(String query) {
    if (query.isEmpty) {
      return;
    } else {
      setState(() {
        searchedSupplication = masnoonDua.where((element) {
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
                builder: (context) => DuaScreen(),
              ),
            ),
          ),
        ),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(bgImage),
                fit: BoxFit.cover),
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
                      'Masnoon Dua',
                      style: kQuestionTextStyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  // shrinkWrap: true,
                  pageSize: 20,
                  padding: const EdgeInsets.only(bottom: 12.0),
                  itemBuilder: (context, index, dynamic item) {
                    return AnimatedTile2(
                      text: searchedSupplication[index].name,
                      dua: searchedSupplication[index].dua,
                      translation: searchedSupplication[index].translation,
                    );
                  },
                  itemCount: searchedSupplication.length,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AnimatedTile extends StatefulWidget {
  const AnimatedTile({Key? key, required this.text}) : super(key: key);
  final text;

  @override
  State<AnimatedTile> createState() => _AnimatedTileState();
}

class _AnimatedTileState extends State<AnimatedTile> {
  double _animatedHeight = 130.0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xffD9D9D9), borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new GestureDetector(
            onTap: () => setState(() {
              _animatedHeight != 0.0
                  ? _animatedHeight = 0.0
                  : _animatedHeight = 130.0;
            }),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffB788B7),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  widget.text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              height: 55.0,
            ),
          ),
          new AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            child: Center(
              child: Text(
                'This is the description of the first text',
                style: TextStyle(color: Colors.white, fontSize: 25.0),
              ),
            ),
            height: _animatedHeight,
            padding: const EdgeInsets.all(12.0),
          )
        ],
      ),
    );
  }
}
