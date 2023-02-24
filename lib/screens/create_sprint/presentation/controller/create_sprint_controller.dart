import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:intl/intl.dart';

class CreateSprintController extends GetxController {
  var isLoading = false.obs;
  final createProjectForm = GlobalKey<FormState>();
  TextEditingController sprintNameController = TextEditingController();
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

  onCreateSprint() async {
    // var prjojectID = Get.arguments;
    // if (!createProjectForm.currentState!.validate()) return;
    // isLoading(true);
    // try {
    //   var _ = await _projectService.createSprint(
    //     sprintNameController.text,
    //     descriptionController.text,
    //     prjojectID,
    //     startDateController.text,
    //     endDateController.text,
    //   );
    //   var dashboardController = Get.find<DashboardController>();
    Get.offAll(() => (DashboardScreen()));
    //   dashboardController.getProjects();
    //   dashboardController.showTopToast('⚡️ Your sprint is created');
    // } catch (e) {
    //   handleException(e);
    // } finally {}
  }
}
