import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/login/presentation/screens/login_screen.dart';
import 'package:innoscripta/screens/sign_up/presentation/controller/signup_controller.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/overlay_background.dart';
import 'package:innoscripta/widgets/static_appbar.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({Key? key}) : super(key: key);
  final SignupController getControllerSignUp = Get.put(SignupController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderWidget(
        isLoading: getControllerSignUp.isLoading.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const StaticAppBar(
            showBackButton: false,
          ),
          body: BackgroundOverlay(
            grayHeight: 0.25,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Form(
                key: getControllerSignUp.signUpFormKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              'Give us\na try ',
                              style: TextStyle(
                                  fontSize: 32, fontWeight: FontWeight.w700),
                            ),
                            Image.asset(
                              'assets/images/signup_image.png',
                              height: Get.height * 0.20,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Sign up for free',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 60,
                      ),
                      InputField(
                        title: 'Your name',
                        hintText: 'Enter your name  ',
                        validator: Validators.fieldRequired,
                        textEditingController:
                            getControllerSignUp.controllerName,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        title: 'E-mail',
                        hintText: 'Enter your e-mail',
                        validator: Validators.emailValidator,
                        textEditingController:
                            getControllerSignUp.controllerEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        title: 'Password',
                        hintText: 'Enter your password',
                        textEditingController:
                            getControllerSignUp.controllerPassword,
                        validator: Validators.passwordValidator,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obsecure: true,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          ElevatedButton(
                            onPressed: getControllerSignUp.signUp,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: AppTheme.colorPrimary),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              child: Text(
                                'Sign up',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Already have ',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LoginScreen());
                            },
                            child: const Text(
                              'an account?',
                              style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
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
