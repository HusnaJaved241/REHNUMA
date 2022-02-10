import 'package:flutter/material.dart';
import 'package:rehnuma/widgets/center_portion.dart';
import 'package:rehnuma/widgets/upper_portion.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffc0ffa6),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_outlined,
            color: Colors.black,
            size: 30.0,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: UpperPortion(),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();

        },
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CenterPortion(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_forward_ios),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        onPressed: () {},
      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      resizeToAvoidBottomInset: false

    );
  }
}

//  Padding(
//             padding: const EdgeInsets.only(
//               bottom: 15.0,
//             ),
//             child: CircleAvatar(
//               child: Icon(
//                 Icons.arrow_forward,
//                 size: 30.0,
//               ),
//               radius: 30.0,
//             ),
//           ),