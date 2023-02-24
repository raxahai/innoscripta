import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/dto/project/epic_list_response_model.dart';
import 'package:innoscripta/core/dto/project/project_list_response_model.dart';
import 'package:innoscripta/core/dto/project/story_list_response_model.dart';
import 'package:innoscripta/screens/create_epic/presentation/screens/create_epic_screen.dart';
import 'package:innoscripta/screens/create_project/presentation/screens/create_project_screen.dart';
import 'package:innoscripta/screens/create_sprint/presentation/screens/create_sprint_screen.dart';
import 'package:innoscripta/screens/create_story/presentation/screens/create_story_screen.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/widgets/project_add.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class DashboardController extends GetxController {
  int newProjectID = -1;

  var projects = <Project>[].obs;
  var stories = <Story>[].obs;
  var epics = <Epic>[].obs;

  List<String> filters = [];
  Project? selectedProject;
  var isLoading = false.obs;

  dynamic argumentData = Get.arguments;
  bool isFilterVisible = false;
  OverlayState? filterOverlayState;
  OverlayEntry? filterOverlayEntry;

  bool isSortFilterVisible = false;
  OverlayState? sortFilterOverlayState;
  OverlayEntry? sortFilterOverlayEntry;

  var isEpicSelected = false.obs;
  var isStorySelected = true.obs;

  var showStories = true.obs;

  BuildContext? context;

  var sortType = ''.obs;

  var epicCount = 0.obs;
  var storyCount = 0.obs;

  var storyEmptyText = ''.obs;

  @override
  void onInit() {
    super.onInit();
    getProjects();
  }

  getProjects() async {
    // try {
    //   isLoading(true);
    //   var res = await _projectService.getProjects();
    //   projects.value = res.result!.rows!;
    //   handleNewProject();
    // } catch (e) {
    //   handleException(e);
    // } finally {
    //   isLoading(false);
    // }
  }

  Future getProjectStories() async {
    // try {
    //   isLoading(true);
    //   StoryListResponseModel res =
    //       await _projectService.getProjectStories(selectedProject!.projectId!);
    //   isEpicSelected(false);
    //   isStorySelected(true);
    //   showStories(true);
    //   stories.value = res.result!.rows!;
    //   storyCount.value = stories.length;
    //   storyEmptyText.value = 'This project has no stories.';
    //   await getProjectEpics();
    // } catch (e) {
    //   handleException(e);
    // } finally {
    //   isLoading(false);
    // }
  }

  getProjectEpics() async {
    // try {
    //   EpicListResponseModel res =
    //       await _projectService.getProjectEpics(selectedProject!.projectId!);
    //   epics.value = res.result!.rows!;
    //   epicCount.value = epics.length;
    // } catch (e) {
    //   handleException(e);
    // }
  }

  showTopToast(String msg) {
    OverlayState? state = Overlay.of(context!);
    showTopSnackBar(
        state,
        Container(
          decoration: BoxDecoration(
            color: AppTheme.colorGray,
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: DefaultTextStyle(
                style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
                child: Text(
                  msg,
                ),
              ),
            ),
          ),
        ),
        padding: const EdgeInsets.all(70));
  }

  handleNewProject() {
    var prjojectID = Get.arguments;
    if (prjojectID != null) {
      showTopToast('⚡️ Your project is created');
      Get.bottomSheet(ProjectAdd(
          onNewProjec: () {
            Get.to(CreateProjectScreen());
          },
          selectedProject: projects.last,
          projects: projects,
          epicCount: 0,
          taskCount: 0,
          storyCount: 0,
          onNewSprint: () {
            Get.to(CreateSprintScreen(), arguments: prjojectID);
          },
          onEpicAdd: () {
            Get.to(CreateEpicScreen(), arguments: prjojectID);
          },
          onProjectSelected: (x) {},
          onStoryAdd: () {
            Get.to(CreateStoryScreen(), arguments: prjojectID);
          },
          onTaskAdd: () {
            // Get.to(CreateTaskScreen(), arguments: prjojectID);
          }));
    }
  }

  openBottomSheet() {
    String? prjojectID;
    // prjojectID = projects.first.projectId;
    prjojectID = "123213123";
    Get.bottomSheet(ProjectAdd(
        onNewProjec: () {
          Get.to(CreateProjectScreen());
        },
        onNewSprint: () {
          Get.to(CreateSprintScreen(), arguments: int.parse(prjojectID!));
        },
        // selectedProject: selectedProject ?? projects.first,
        selectedProject: [Project(projectId: "234234234")].first,
        projects: projects,
        epicCount: epicCount.value,
        taskCount: 0,
        storyCount: storyCount.value,
        onEpicAdd: () {
          Get.to(CreateEpicScreen(), arguments: int.parse(prjojectID!));
        },
        onProjectSelected: (x) {
          prjojectID = x.projectId;
        },
        onStoryAdd: () {
          if (prjojectID != null) {
            Get.to(CreateStoryScreen(), arguments: int.parse(prjojectID!));
          }
        },
        onTaskAdd: () {
          if (prjojectID != null) {
            // Get.to(CreateTaskScreen(), arguments: int.parse(prjojectID!));
          }
        }));
  }

  applyFilter() {
    if (isStorySelected.value) {
      showStories(true);
    } else {
      showStories(false);
    }
    if (filterOverlayState != null) {
      isFilterVisible = false;
      filterOverlayEntry!.remove();
    }
  }

  applySort() {
    if (showStories.value) {
      if (sortType.value == 'dateAdded') {
        stories.sort((a, b) {
          int aDate = DateTime.parse(a.createdAt ?? '').microsecondsSinceEpoch;
          int bDate = DateTime.parse(b.createdAt ?? '').microsecondsSinceEpoch;
          return bDate.compareTo(aDate);
        });
      }
      if (sortType.value == 'lastEdited') {
        stories.sort((a, b) {
          int aDate = DateTime.parse(a.updatedAt ?? '').microsecondsSinceEpoch;
          int bDate = DateTime.parse(b.updatedAt ?? '').microsecondsSinceEpoch;
          return bDate.compareTo(aDate);
        });
      }
    }
    update();
  }

  bool checkSortType(String type) {
    if (sortType.value == type) {
      return true;
    }
    return false;
  }
}
