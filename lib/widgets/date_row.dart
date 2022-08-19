import 'package:flutter/material.dart';

class DateRow extends StatefulWidget {
  final Color color;
  final Function() press;
  final String selectedButton;
  final String day;
  final dynamic date;
  final dynamic month;
  final String emotion;
  const DateRow({
    Key? key,
    required this.color,
    required this.press,
    required this.selectedButton,
    required this.day,
    this.date,
    this.month,
    required this.emotion,
  }) : super(key: key);

  @override
  _DateRowState createState() => _DateRowState();
}

class _DateRowState extends State<DateRow> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: widget.press,
      style: ElevatedButton.styleFrom(
        // backgroundColor: widget.color,
        primary: widget.color,
        side: BorderSide(
          color: Colors.black,
          width: 0.5,
        ),
        shadowColor: Colors.transparent,
      ),
      child: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Column(
          children: [
            Text(
              '${widget.date} ${widget.month}',
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
            Text(
              widget.emotion.isEmpty ? "?" : widget.emotion,
              style: TextStyle(fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
