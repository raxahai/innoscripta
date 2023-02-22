import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:innoscripta/screens/dashboard/dashboard_screen.dart';
import 'package:innoscripta/utils/global.dart';

class LoginController extends GetxController {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  var isLoading = false.obs;

  login() async {
    if (!loginFormKey.currentState!.validate()) return;
    Get.offAll(() => DashboardScreen());
  }

  Future storeValues(String userID, String token) async {
    final getStorage = GetStorage();
    await getStorage.write(StorageKeys.userIdKey, userID);
    await getStorage.write(StorageKeys.userTokenKey, token);
    authenticator.setUserId(userID);
    authenticator.setUserToken(token);
  }
}
