import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class UpdateProfile extends StatelessWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                bgImage2,
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Text('Update Profile'),
        ),
      ),
    );
  }
}
