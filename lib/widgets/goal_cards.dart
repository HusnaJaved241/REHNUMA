import 'package:flutter/material.dart';

class GoalCards extends StatelessWidget {
  const GoalCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.only(
        bottom: 40.0,
      ),
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Cards(),
              SizedBox(
                width: 30.0,
              ),
              Cards(),
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Row(
            children: [
              SizedBox(
                width: 10.0,
              ),
              Cards(),
              SizedBox(
                width: 30.0,
              ),
              Cards(),
            ],
          ),
        ],
      ),
    );
  }
}

Widget Cards() {
  return Center(
    child: Card(
      elevation: 10,
       shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(20.0),
    ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0,),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0xff91ac9d),
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(4.0, 4.0),
            ),
          ],
          color: Color(0xff73bb55),
        ),
        height: 140.0,
        width: 130.0,
      ),
    ),
  );
}


// 91ac9d