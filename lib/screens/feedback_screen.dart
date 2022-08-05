import 'package:flutter/material.dart';
import 'package:rehnuma/constants.dart';

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var currentHeight = MediaQuery.of(context).size.height;
    var currentWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: appColor,
        title: Text('Feedback'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 10.0, top: 20.0),
                height: currentHeight * 0.7,
                width: currentWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Column(
                  children: [
                    Container(
                      height: currentHeight * 0.5,
                      margin: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.grey[200],
                      ),
                      child: TextFormField(
                        
                        decoration: InputDecoration(
                          
                          contentPadding: const EdgeInsets.all(10.0),
                          // focusedBorder: ,
                          fillColor: Colors.white,
                          hintText: 'Comments...',
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          disabledBorder:  OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Colors.transparent,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Colors.transparent, width: 2.0),
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                        ),
                        validator: (val) {
                          if (val!.length == 0) {
                            return "Note cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        cursorColor: appColor,
                        keyboardType: TextInputType.multiline,
                        maxLines: 17,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        children: [
                          Icon(
                            Icons.add_box_outlined,
                          ),
                          SizedBox(
                            width: currentWidth * 0.05,
                          ),
                          Text(
                            'Attach a Screenshot',
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                fontSize: 20.0),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('Submit'),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                      horizontal: currentWidth * .1,
                      vertical: currentHeight * 0.02),
                  primary: appColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
