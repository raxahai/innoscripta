import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/login/presentation/screens/login_screen.dart';

class SignupController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  signUp() async {
    if (!signUpFormKey.currentState!.validate()) return;
    Get.offAll(() => LoginScreen());
  }
}
