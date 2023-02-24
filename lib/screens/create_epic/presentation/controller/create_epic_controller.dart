import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:intl/intl.dart';

class CreateEpicController extends GetxController {
  var isLoading = false.obs;
  final createProjectForm = GlobalKey<FormState>();
  TextEditingController epicNameController = TextEditingController();
  TextEditingController startDateController = TextEditingController();
  TextEditingController endDateController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  onStartDateClicked() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      startDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  onEndDateClicked() async {
    final DateTime? pickedDate = await showDatePicker(
      context: Get.context!,
      firstDate: DateTime(DateTime.now().year),
      lastDate: DateTime(DateTime.now().year + 5),
      initialDate: DateTime.now(),
    );
    if (pickedDate != null) {
      endDateController.text = DateFormat('dd-MM-yyyy').format(pickedDate);
    }
  }

  onCreateEpic() async {
    Get.offAll(() => DashboardScreen());
  }
}
