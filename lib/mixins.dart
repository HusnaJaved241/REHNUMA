import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

mixin GetSnack{
  showSnackBar({required String title,required String msg}) {
    Get.rawSnackbar(message: msg,title: title, backgroundColor: Colors.black,);
  }
}
mixin ProgressSpin {
  Container showProgress() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Center(
        child: SpinKitFadingCube(color: Color(0xff9C77B8),),
      ),
    );
  }
}