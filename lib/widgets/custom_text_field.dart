import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  final String hint;
  final TextInputType inputType;
  final TextEditingController myController;
  final String? Function(String?)? validator;
  final bool password;
  const CustomTextField(
      {Key? key,
      required this.hint,
      required this.inputType,
      required this.myController, this.validator, this.password=false})
      : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: TextFormField(
        validator: widget.validator?? (value){
          if(value!.length < 3){
            return "Enter at least 3 characters";
          }
          return null;
        },
        // onSubmitted: (value) {
        //   value = widget.myController.text;
        //   print(value);
        //   widget.myController.clear();
        // },
        controller: widget.myController,
        style: TextStyle(fontSize: 30.0),
        keyboardType: widget.inputType,
        textCapitalization: TextCapitalization.words,
        cursorColor: Colors.black,
        cursorRadius: Radius.circular(4.0),
        cursorWidth: 5.0,
        cursorHeight: 45.0,
        obscureText: widget.password,
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
