import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hint;
  final TextInputType inputType;
  const CustomTextField({Key? key, required this.hint, required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        style: TextStyle(fontSize: 30.0),
        keyboardType: inputType,
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.black,
        cursorRadius: Radius.circular(4.0),
        cursorWidth: 5.0,
        cursorHeight: 45.0,
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            fontSize: 30.0,
          ),
          focusedBorder: OutlineInputBorder(
            // borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Colors.transparent,
            ),
          ),
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
