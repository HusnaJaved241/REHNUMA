import 'package:flutter/material.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';
import 'package:rehnuma/constants.dart';
// import 'package:flutter_linear_datepicker/flutter_datepicker.dart';

class ScrollingDatePicker extends StatelessWidget {
     late final DateTime selectedDate;

  @override
  Widget build(BuildContext context) {
    return DatePickerWidget(
      looping: false, // default is not looping
      firstDate: DateTime(1990, 01, 01),
      lastDate: DateTime.now(),
      initialDate: DateTime.now(),
      dateFormat: "dd-MMM-yyyy",
      locale: DatePicker.localeFromString('en'),
      onChange: (DateTime newDate, _) => selectedDate = newDate,
      pickerTheme: DateTimePickerTheme(
        backgroundColor: appColor,
        itemTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 25.0,
          fontWeight: FontWeight.w700,
        ),
        dividerColor: Color(0xffebc014),
      ),
    );
  }
}
