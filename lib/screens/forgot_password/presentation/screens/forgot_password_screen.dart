import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:innoscripta/utils/app_theme_consts.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/overlay_background.dart';
import 'package:innoscripta/widgets/static_appbar.dart';

class ForgotScreen extends StatelessWidget {
  ForgotScreen({Key? key}) : super(key: key);
  final ForgotPasswordController forgotPasswordController =
      Get.put(ForgotPasswordController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderWidget(
        isLoading: forgotPasswordController.isLoading.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const StaticAppBar(
            showBackButton: true,
          ),
          body: BackgroundOverlay(
            grayHeight: 0.35,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: forgotPasswordController.forgotPasswordFormKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    const Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    InputField(
                      title: 'E-mail',
                      hintText: 'Enter your e-mail',
                      textEditingController:
                          forgotPasswordController.emailController,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ElevatedButton(
                      onPressed: forgotPasswordController.onForgotPassword,
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                          backgroundColor: AppTheme.colorPrimary),
                      child: const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 18, horizontal: 12),
                        child: Text(
                          'Send ',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
