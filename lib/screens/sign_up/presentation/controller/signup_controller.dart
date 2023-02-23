import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/injection_container.dart';
import 'package:innoscripta/screens/login/presentation/screens/login_screen.dart';
import 'package:innoscripta/screens/sign_up/domain/usecase/create_user.dart';

class SignupController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  TextEditingController controllerName = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final Signup _signup = locator<Signup>();

  signUp() async {
    if (!signUpFormKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _signup(controllerEmail.text, controllerPassword.text);
    result.fold((l) => l.toString(), (r) => print("success"));
    isLoading(false);
    Get.offAll(() => LoginScreen());
  }
}
