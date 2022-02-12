import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController myController;
  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.inputType,
      required this.myController})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextField(
        onSubmitted: (value) {
          value = widget.myController.text;
          print(value);
          widget.myController.clear();
        },
        controller: widget.myController,
        style: TextStyle(fontSize: 30.0),
        keyboardType: widget.inputType,
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.black,
        cursorRadius: Radius.circular(4.0),
        cursorWidth: 5.0,
        cursorHeight: 45.0,
        decoration: InputDecoration(
          hintText: widget.hint,
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
