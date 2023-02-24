import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/dashboard/presentation/screens/dashboard_screen.dart';

class CreateProjectcontroller extends GetxController {
  TextEditingController projectNameController = TextEditingController();
  var isLoading = false.obs;
  var isScrumSelected = false.obs;
  var isKanbanSelected = false.obs;
  var isWaterFal = false.obs;
  var isTodoSeleced = false.obs;
  var isBoardSelected = false.obs;
  String selectdProjectType = '';
  final createProjectForm = GlobalKey<FormState>();

  onCreateProject() async {
    // Get.bottomSheet(ProjectAdd());
    // // Get.find<DashboardController>().isNewProjectCreatd = true;

    // return;
    // if (!createProjectForm.currentState!.validate()) return;
    // if (selectdProjectType == '') {
    //   Get.showSnackbar(
    //     const GetSnackBar(
    //       message: 'Please select project type',
    //       duration: Duration(seconds: 2),
    //     ),
    //   );
    //   return;
    // }
    // isLoading(true);
    // try {
    //   CreateProjectResponseModel res = await _projectService.createProject(
    //     projectNameController.text,
    //     GlobalConstants.projectType[selectdProjectType]!,
    //   );
    //   var dashboardController = Get.find<DashboardController>();
    // Get.offAll(() => (DashboardScreen()), arguments: res.result!.projectId);
    Get.offAll(() => (DashboardScreen()));
    //   dashboardController.getProjects();
    // } catch (e) {
    //   handleException(e);
    // }
    // isLoading(false);
  }

  onProjectSelected(String selected) {
    selectdProjectType = selected;
    if (selected == "scrum") {
      isScrumSelected(true);
      isKanbanSelected(false);
      isWaterFal(false);
      isBoardSelected(false);
      isTodoSeleced(false);
    } else if (selected == "kanban") {
      isKanbanSelected(true);
      isWaterFal(false);
      isBoardSelected(false);
      isScrumSelected(false);
      isTodoSeleced(false);
    } else if (selected == "waterfal") {
      isWaterFal(true);
      isScrumSelected(false);
      isBoardSelected(false);
      isScrumSelected(false);
      isTodoSeleced(false);
      isKanbanSelected(false);
    } else if (selected == "todo") {
      isTodoSeleced(true);
      isWaterFal(false);
      isScrumSelected(false);
      isBoardSelected(false);
      isScrumSelected(false);
      isKanbanSelected(false);
    } else if (selected == "board") {
      isBoardSelected(true);
      isTodoSeleced(false);
      isWaterFal(false);
      isScrumSelected(false);
      isKanbanSelected(false);
    }
  }
}
