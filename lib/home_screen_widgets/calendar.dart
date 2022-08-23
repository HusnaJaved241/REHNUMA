import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;

const calenderTextStyle = TextStyle(fontSize: 18.0, color: Colors.white);

class Calendar extends StatefulWidget {
  Calendar({Key? key, required this.onChanged, required this.selectedDate}) : super(key: key);
  final Function(DateTime, List) onChanged;
  final DateTime selectedDate;

  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {


  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 200.0,
      height: MediaQuery.of(context).size.height * 0.3,
      margin: EdgeInsets.symmetric(
        horizontal: 1.0,
        vertical: 0.0,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: CalendarCarousel(
        isScrollable: true,
        headerMargin: const EdgeInsets.all(0),
        weekDayBackgroundColor: Colors.green,
        weekdayTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),

        weekDayPadding: const EdgeInsets.all(5.0),
        weekDayMargin: const EdgeInsets.all(1.0),
        dayButtonColor: Colors.pink.shade100,
        childAspectRatio: 1.5,
        onDayPressed: widget.onChanged,
        headerTextStyle: TextStyle(
          color: Colors.green,
          fontWeight: FontWeight.bold,
          fontSize: 20.0,
        ),
        inactiveDaysTextStyle: calenderTextStyle,
        leftButtonIcon: Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.green,
        ),
        rightButtonIcon: Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.green,
        ),
        todayTextStyle: calenderTextStyle,
        daysTextStyle: calenderTextStyle,
        dayPadding: 1.0,
        todayButtonColor: Color(0xffffb300),
        selectedDayButtonColor: Colors.amber.shade600,
        weekendTextStyle: calenderTextStyle,
        thisMonthDayBorderColor: Colors.grey,
        customDayBuilder: (
          /// you can provide your own build function to make custom day containers
          bool isSelectable,
          int index,
          bool isSelectedDay,
          bool isToday,
          bool isPrevMonthDay,
          TextStyle textStyle,
          bool isNextMonthDay,
          bool isThisMonthDay,
          DateTime day,
        ) {
          /// If you return null, [CalendarCarousel] will build container for current [day] with default function.
          /// This way you can build custom containers for specific days only, leaving rest as default.

          // Example: every 15th of month, we have a flight, we can place an icon in the container like that:
          // if (day.day == 15) {
          //   return Center(
          //     child: Icon(Icons.local_airport),
          //   );
          // } else {
          //   return null;
          // }
        },
        weekFormat: false,
        // markedDatesMap: _markedDateMap,
        height: 400.0,
        selectedDateTime: widget.selectedDate,
        daysHaveCircularBorder: false,

        /// null for not rendering any border, true for circular border, false for rectangular border
      ),
    );
  }
}
