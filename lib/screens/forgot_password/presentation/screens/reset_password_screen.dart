import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/forgot_password/presentation/controller/forgot_password_controller.dart';
import 'package:innoscripta/core/utils/app_theme_consts.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/overlay_background.dart';
import 'package:innoscripta/widgets/static_appbar.dart';

class SetNewPasswordScreen extends StatelessWidget {
  SetNewPasswordScreen({Key? key}) : super(key: key);
  final ForgotPasswordController forgotPasswordController =
      Get.find<ForgotPasswordController>();
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
              child: SingleChildScrollView(
                child: Form(
                  key: forgotPasswordController.newPasswordFormKey,
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
                      InputField(
                        title: 'Verification code',
                        hintText: 'Enter verification code',
                        textEditingController:
                            forgotPasswordController.verificationCodeController,
                        validator: Validators.fieldRequired,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        title: 'Password',
                        hintText: 'Enter your new password',
                        textEditingController:
                            forgotPasswordController.passwordController,
                        validator: Validators.passwordValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obsecure: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ElevatedButton(
                        onPressed: forgotPasswordController.onResetPassword,
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            backgroundColor: AppTheme.colorPrimary),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 18, horizontal: 12),
                          child: Text(
                            'Set new password',
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
      ),
    );
  }
}
