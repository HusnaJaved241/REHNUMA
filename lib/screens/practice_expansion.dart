import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PracticeFirebase extends StatelessWidget {
  const PracticeFirebase({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (ctx, index) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Text("This works"),
            );
          }),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () {
              print('pressed');
              var data = FirebaseFirestore.instance.collection('users').get();
            },
          ),
    );
  }
}
