import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:rehnuma/screens/signin_screen.dart';

import '../appvariables.dart';
import '../models/user_model.dart';

class AuthController extends GetxController {
  var userCollectionReference = FirebaseFirestore.instance.collection('users');
  var isLoading = false.obs;
  Future signUpWithEmailAndPassword(
      String email, String password, var userMap) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      await uploadUserInfo(userMap);
      return "success";
    } catch (e) {
      if (e.toString() == 'email-already-in-use') {
        return 'Email is Already in use';
      } else {
        return null;
      }
    } finally {
      isLoading.value = false;
    }
  }

  Future<dynamic> getUsersByEmail(String email) async {
    try {
      isLoading.value = true;
      var data =
          await userCollectionReference.where('email', isEqualTo: email).get();

      if (data.size > 0) {
        UserModel? userModel;
        for (var document in data.docs) {
          print(document);
          userModel = UserModel.fromJson(document);
          print(userModel.name);
        }
        if (userModel != null) {
          AppVariables.box.write("email", userModel.email);
          AppVariables.box.write("name", userModel.name);
          AppVariables.box.write("gender", userModel.gender);
          AppVariables.box.write("goal", userModel.goal);
          AppVariables.box.write("docId", userModel.docId);
          return userModel;
        } else {
          return null;
        }
      }
    } on FirebaseException catch (e) {
      return e.message;
    } finally {
      isLoading.value = false;
    }
  }

  Future signInWithEmailAndPassword(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential userCredential = await AppVariables.auth
          .signInWithEmailAndPassword(email: email, password: password);

      User? user = userCredential.user;
      return user;
    } on FirebaseAuthException catch (e) {
      return e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      isLoading.value = true;
      await FirebaseAuth.instance.signOut();
      AppVariables.box.erase();
      Get.offAll(SignInScreen());
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }

  

  Future<void> uploadUserInfo(userMap) async {
    try {
      await userCollectionReference.add(userMap);
      return;
    } catch (e) {
      print(e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  // Future<dynamic> getUserData() async {
  //    var data =
  //         await userCollectionReference.where('email', isEqualTo: email).get();

  //     if (data.size > 0) {
  //       UserModel? userModel;
  //       for (var document in data.docs) {
  //         print(document);
  //         userModel = UserModel.fromJson(document);
  //         print(userModel.name);
  //       }
  //       if (userModel != null) {
  //         AppVariables.box.read(userModel.email);
  //         return userModel;
  //       } else {
  //         return null;
  //       }
  // }
}
