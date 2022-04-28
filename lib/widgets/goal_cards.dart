import 'package:flutter/material.dart';

class GoalCards extends StatefulWidget {
  String goal = "";

  @override
  State<GoalCards> createState() => _GoalCardsState();
}

class _GoalCardsState extends State<GoalCards> {
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
              Cards(
                cardText: "Peace",
                onPressed: () {
                  setState(() {
                    widget.goal = "Peace";
                  });
                },
              ),
              SizedBox(
                width: 30.0,
              ),
              Cards(
                cardText: "Career",
                onPressed: () {
                  setState(() {
                    widget.goal = "Career";
                  });
                },
              ),
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
              Cards(
                cardText: "Be Successful",
                onPressed: () {
                  setState(() {
                    widget.goal = "Be Successful";
                  });
                },
              ),
              SizedBox(
                width: 30.0,
              ),
              Cards(
                cardText: "Pray",
                onPressed: () {
                  setState(() {
                    widget.goal = "Pray";
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Cards extends StatelessWidget {
  const Cards({
    Key? key,
    required this.cardText,
    required this.onPressed,
  }) : super(key: key);
  final cardText;
  final onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Card(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          child: Center(
              child: Text(
            cardText,
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          )),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              20.0,
            ),
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
}



// 91ac9d