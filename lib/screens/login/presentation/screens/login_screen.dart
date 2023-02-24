import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/forgot_password/presentation/screens/forgot_password_screen.dart';
import 'package:innoscripta/screens/login/presentation/controller/login_controller.dart';
import 'package:innoscripta/core/utils/app_theme_consts.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/overlay_background.dart';
import 'package:innoscripta/widgets/static_appbar.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final LoginController getControllerLogin = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderWidget(
        isLoading: getControllerLogin.isLoading.value,
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: const StaticAppBar(
            showBackButton: true,
          ),
          body: BackgroundOverlay(
            grayHeight: 0.28,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: SingleChildScrollView(
                child: Form(
                  key: getControllerLogin.loginFormKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          'assets/images/login_image.png',
                          height: Get.height * 0.40,
                        ),
                      ),
                      const Text(
                        'Login',
                        style: TextStyle(fontSize: 24),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      InputField(
                        title: 'E-mail',
                        hintText: 'Enter your e-mail',
                        textEditingController:
                            getControllerLogin.controllerEmail,
                        validator: Validators.emailValidator,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InputField(
                        title: 'Password',
                        hintText: 'Enter your password',
                        textEditingController:
                            getControllerLogin.controllerPassword,
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
                            onPressed: getControllerLogin.login,
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                backgroundColor: AppTheme.colorPrimary),
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    fontSize: 14, fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          const Text(
                            'Forgot your login ',
                            style: TextStyle(fontWeight: FontWeight.w700),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => ForgotScreen());
                            },
                            child: const Text(
                              'click here',
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
