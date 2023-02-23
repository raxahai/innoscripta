import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innoscripta/injection_container.dart';
import 'package:innoscripta/screens/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:innoscripta/core/utils/global.dart';
import 'package:innoscripta/screens/login/domain/usecase/login.dart';

class LoginController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  final Login _login = locator<Login>();

  login() async {
    if (!loginFormKey.currentState!.validate()) return;
    isLoading(true);
    final result = await _login(controllerEmail.text, controllerPassword.text);
    isLoading(false);
    result.fold((l) => print("failure"), (r) {
      print("successful login");
      Get.offAll(() => DashboardScreen());
    });
  }

  Future storeValues(String userID, String token) async {
    final getStorage = GetStorage();
    await getStorage.write(StorageKeys.userIdKey, userID);
    await getStorage.write(StorageKeys.userTokenKey, token);
    authenticator.setUserId(userID);
    authenticator.setUserToken(token);
  }
}
