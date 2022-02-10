import 'package:flutter/material.dart';
import 'package:flutter_linear_datepicker/flutter_datepicker.dart';

class ScrollingDatePicker extends StatelessWidget {
  const ScrollingDatePicker({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinearDatePicker(
        columnWidth: 90.0,
        startDate: "2004/10/17", //yyyy/mm/dd
        endDate: "2020/02/20",
        initialDate: "2010/11/15",
        dateChangeListener: (String selectedDate) {
          print(selectedDate);
        },
        showDay: true, //false -> only select year & month
        labelStyle: TextStyle(
            fontSize: 20.0, color: Colors.black, fontWeight: FontWeight.w600),
        selectedRowStyle: TextStyle(
          fontSize: 16.0,
          color: Colors.black,
        ),
        unselectedRowStyle: TextStyle(
          fontSize: 14.0,
          color: Colors.grey,
        ),
        yearText: "year",
        monthText: "month",
        dayText: "day",
        showLabels: true, // to show column captions, eg. year, month, etc.
        showMonthName: true,
        isJalaali: false // false -> Gregorian
        );
  }
}
