import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: appColor,
        appBar: AppBar(
          backgroundColor: appColor,
          title: Text('About Us'),
          bottom: TabBar(
            indicatorColor: Colors.black,
            labelColor: Colors.black,
            tabs: [
              Tab(
                text: 'OverView',
              ),
              Tab(
                text: 'Developers',
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            OverviewWidget(),
            DevelopersWidget(),
          ],
        ),
      ),
    );
  }
}

class OverviewWidget extends StatelessWidget {
  const OverviewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var currentHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SizedBox(
        height: currentHeight,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'OVERVIEW',
              style: TextStyle(fontSize: 30.0, letterSpacing: 2.5),
            ),
            Text(
              'REHNUMA means “The one who Guides". It is a mobile appointended to guide you during your low and hard times in the light of Quran and Sunnah.\nEmotions, no matter of which type they are, can b overwhelming and dominating at somewhere at some point. To cope up the emotions and complex human psychology REHNUMA brings forward some compiled efforts in one place to help you out.\n REHNUMA is created by the one who understood the problem for the one who are experiencing problem.',
              style: TextStyle(
                fontSize: 20.0,
                // letterSpacing: 1.5,
              ),
              textAlign: TextAlign.center,
            ),
            Image.asset(
              'assets/images/overview_image.png',
              height: currentHeight * 0.2,
              width: currentWidth * 0.6,
            ),
          ],
        ),
      ),
    );
  }
}

class DevelopersWidget extends StatelessWidget {
  const DevelopersWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;
    var currentHeight = MediaQuery.of(context).size.height;
    return Container(
      padding: const EdgeInsets.all(0.0),
      child: Stack(
        children: [
          Positioned(
            //  top: currentHeight * 0.2,
            top: 10.0,
            left: currentWidth * 0.04,
            width: currentWidth * 0.47,
            height: currentHeight * 0.5,
            child: customContainer(
              name: 'Husna Javed',
              regNo: 3670,
            ),
          ),
          Positioned(
            top: currentHeight * 0.12,
            left: currentWidth * 0.49,
            width: currentWidth * 0.47,
            height: currentHeight * 0.5,
            child: customContainer(
              name: 'Maham Shehzadi',
              regNo: 3666,
            ),
          ),
          Positioned(
            top: currentHeight * 0.5,
            width: currentWidth * 0.6,
            height: currentHeight * 0.4,
            child: Image.asset(
              'assets/images/developers_image.png',
            ),
          ),
          //
        ],
      ),
    );
  }
}

class customRow extends StatelessWidget {
  const customRow({Key? key, required this.icon, required this.text})
      : super(key: key);
  final icon;
  final text;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon),
        SizedBox(width: 10.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          // height: 50.0,
          child: Text(
            text,
            style: kQuestionDescStyle,
          ),
        ),
      ],
    );
  }
}

class customContainer extends StatelessWidget {
  const customContainer({Key? key, required this.name, required this.regNo})
      : super(key: key);
  final name;
  final regNo;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      decoration: BoxDecoration(
          color: Colors.white70,
          borderRadius: BorderRadius.circular(15.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 5,
              blurRadius: 1,
              offset: Offset(-4, 3.5), // changes position of shadow
            ),
          ]),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            name,
            style: kQuestionDescStyle,
          ),
          customRow(icon: Icons.school, text: 'BS Software Engineering'),
          customRow(icon: Icons.location_city_outlined, text: 'IIUI'),
          customRow(icon: Icons.location_on, text: 'Islamabad'),
          customRow(icon: Icons.email, text: 'husna.bsse$regNo@iiu.edu.pk'),
        ],
      ),
    );
  }
}

// Positioned(
//             width: currentWidth * .5,
//             height: currentHeight * .4,
//             bottom: currentHeight * .4,
//             top: 0,
//             right: 0,
//             left: 0,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
              // child: Column(
              //   children: [
              //     Text('Husna Javed'),
              //     customRow(Icons.school, 'BS Software Engineering'),
              //     customRow(Icons.location_city_outlined, 'IIUI'),
              //     customRow(Icons.location_on, 'Islamabad'),
              //     customRow(Icons.email, 'husna.bsse3670@iiu.edu.pk'),
              //   ],
              // ),
//             ),
//           ),
//           Positioned(
//             width: currentWidth * .5,
//             height: currentHeight * .4,
//             bottom: currentHeight * .2,
//             top: 10,
//             right: 20,
//             left: 10,
//             child: Card(
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0),
//               ),
//               child: Column(
//                 children: [
//                   Text('Maham Shehzadi'),
//                   customRow(Icons.school, 'BS Software Engineering'),
//                   customRow(Icons.location_city_outlined, 'IIUI'),
//                   customRow(Icons.location_on, 'Islamabad'),
//                   customRow(Icons.email, 'maham.bsse3666@iiu.edu.pk'),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),