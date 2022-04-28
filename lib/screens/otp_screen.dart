// import 'package:flutter/material.dart';
// import 'package:rehnuma/constants.dart';
// import 'package:rehnuma/screens/home_screen.dart';
// import 'package:rehnuma/widgets/elevated_button.dart';

// class OTPScreen extends StatelessWidget {
//   const OTPScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: appColor,
//       body: Padding(
//         padding: const EdgeInsets.all(40.0),
//         child: _body(context),
//       ),
//     );
//   }

//   Widget _body(BuildContext context) {
//     return _topLayout(context);
//   }

//   Widget _boxWithLabel(BuildContext context) {
//     return Column(
//       children: <Widget>[
//         SizedBox(
//           height: 40.0,
//         ),
//         Container(
//           margin: EdgeInsets.symmetric(
//             vertical: 5,
//             horizontal: 25,
//           ),
//           alignment: Alignment.centerLeft,
//           child: Text(
//             "Enter OTP:",
//             style: TextStyle(
//               fontWeight: FontWeight.bold,
//               fontSize: 20,
//               color: Colors.orange,
//             ),
//           ),
//         ),
//         _boxBuilder(),
//         SizedBox(
//           height: 40.0,
//         ),
//         _bottomButton(context),

//       ],
//     );
//   }

//   Widget _boxBuilder() {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: <Widget>[
//         _box(),
//         _box(),
//         _box(),
//         _box(),
//       ],
//     );
//   }

//   Widget _box() {
//     return Container(
//       margin: EdgeInsets.symmetric(
//         vertical: 5,
//         horizontal: 3,
//       ),
//       height: 50,
//       width: 50,
//       child: TextField(
//         cursorColor: Colors.black,
//         cursorHeight: 25.0,
//         textAlign: TextAlign.center,
//         style: TextStyle(
//           fontSize: 30.0,
//           color: Colors.black,
//         ),
//         keyboardType: TextInputType.number,
//         maxLength: 1,
//         decoration: InputDecoration(
//           border: InputBorder.none,
//           counterText: '',
//         ),
//       ),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.lightGreen),
//       ),
//     );
//   }

//   Widget _headerImage() {
//     return Container(
//       margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
//       child: Image.asset(
//         "assets/images/logo.png",
//         fit: BoxFit.cover,
//         height: 160,
//       ),
//     );
//   }

//   Widget _bottomButton(BuildContext context) {
//     return CustomElevatedButton(
//       btnName: 'Login',
//       nextScreen: HomeScreen(),
//     );
//   }

//   Widget _topLayout(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: <Widget>[
//           _headerImage(),
//           _boxWithLabel(context),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class EmailVerificationScreen extends StatelessWidget {
  const EmailVerificationScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Verify your email"),
      ),
      
    );
  }
}
