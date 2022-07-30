import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_storage/get_storage.dart';

class AppVariables{
  static String selectedGoal = "";
  static String selectedGender = "";
  static final FirebaseAuth auth = FirebaseAuth.instance;
  static final box = GetStorage();
}