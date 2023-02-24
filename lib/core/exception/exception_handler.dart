import 'package:get/get.dart';
import 'package:innoscripta/core/failure/failure.dart';
import 'package:innoscripta/widgets/dialog.dart';

class ExceptionHandler {
  void handleException(Failure failure) {
    Get.dialog(ErrorDialog(title: "Error", message: failure.getMessage));
  }
}
