import 'package:flutter/material.dart';

Widget buttonStyle(String gender, Color color, Function() onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Builder(builder: (context) {
      return Container(
        width: 200.0,
        padding: const EdgeInsets.symmetric(
          // horizontal: 40.0,
          vertical: 10.0,
        ),
        margin: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            30.0,
          ),
        ),
        child: Text(
          gender,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      );
    }),
  );
}

class GenderWidget extends StatefulWidget {
  String gender = "";

  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

class _GenderWidgetState extends State<GenderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buttonStyle(
          'MALE',
          Color(0xff0c687f),
          () {
            setState(() {
              widget.gender = "Male";
              print(widget.gender);
            });
          },
        ),
        buttonStyle('FEMALE', Color(0xfff28d9f), () {
          setState(
            () {
              widget.gender = 'Female';
              print(widget.gender);

            },
          );
        }),
        buttonStyle('OTHER', Color(0xff31a751), () {
          setState(() {
            widget.gender = 'Other';
              print(widget.gender);

          });
        }),
      ],
    );
  }
}
