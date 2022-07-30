import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key, required this.focusNode}) : super(key: key);
  final focusNode;
  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  void initState() {
    // widget.focusNode.addListener(() {
    //   setState(() => color = widget.focusNode.hasFocus ? Colors.red : Colors.green);
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 15.0,
      width: (MediaQuery.of(context).size.width) - 160,
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: TextFormField(
        cursorColor: appColor,
        cursorHeight: 22.0,
        focusNode: widget.focusNode,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.search_rounded,
          ),
          isDense: true,
          hintText: 'Search',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 10.0,
            // vertical: 2.0,
          ),
          fillColor: Colors.white,
          enabled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.green,
              width: 2.0,
            ),
          ),
          // focusColor: Colors.green,
          filled: true,
        ),
      ),
    );
  }
}
