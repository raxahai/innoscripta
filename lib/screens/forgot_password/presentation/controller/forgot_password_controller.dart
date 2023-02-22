import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/forgot_password/presentation/screens/reset_password_screen.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  GlobalKey<FormState> forgotPasswordFormKey = GlobalKey<FormState>();
  GlobalKey<FormState> newPasswordFormKey = GlobalKey<FormState>();
  TextEditingController passwordController = TextEditingController();
  TextEditingController verificationCodeController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String? authToken;

  void onForgotPassword() async {
    if (!forgotPasswordFormKey.currentState!.validate()) return;
    Get.to(() => SetNewPasswordScreen());
  }

  void onResetPassword() async {
    if (!newPasswordFormKey.currentState!.validate()) return;
    Get.until((route) => route.isFirst);
  }
}
