import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/dto/project/project_list_response_model.dart';
import 'package:innoscripta/screens/create_project/presentation/screens/create_project_screen.dart';
import 'package:innoscripta/screens/dashboard/presentation/controller/dashboard_controller.dart';
import 'package:innoscripta/screens/story_overview/presentation/screens/story_overview_screen.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/dashboard_appbar.dart';
import 'package:innoscripta/widgets/epic_tile_widget.dart';
import 'package:innoscripta/widgets/filter_widget.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/sort_filter_widget.dart';
import 'package:innoscripta/widgets/story_tile_widget.dart';

class DashboardScreen extends StatelessWidget {
  DashboardScreen({Key? key}) : super(key: key);
  final DashboardController controller = Get.put(DashboardController());
  @override
  Widget build(BuildContext context) {
    controller.context = context;
    return Obx(() => LoaderWidget(
          isLoading: controller.isLoading.value,
          child: Scaffold(
            appBar: const DashboardAppBar(),
            body: SingleChildScrollView(
              child: Column(children: [
                if (controller.projects.isEmpty)
                  buildEmptyProjectState()
                else
                  buildProjectState()
              ]),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                controller.openBottomSheet();
              },
              backgroundColor: AppTheme.colorPrimary,
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }

  buildEmptyProjectState() {
    return Column(
      children: [
        SizedBox(
          height: Get.height * 0.18,
        ),
        Align(
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/empty_projects.png',
            height: 120,
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const Text(
          'Start a project',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 5,
        ),
        const Text(
          'Welcome to Innoscripta board',
          style: TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
        ),
        const SizedBox(
          height: 20,
        ),
        CustomButton(
            title: 'Make a project',
            onButtonPressed: () {
              Get.to(() => CreateProjectScreen());
            }),
      ],
    );
  }

  buildProjectState() {
    if (controller.selectedProject != null) {
      return buildStoryState();
    } else {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                buildFilterWidget(),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Please select a project',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      );
    }
  }

  buildStoryState() {
    if (controller.stories.isNotEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(
                  height: Get.height * 0.03,
                ),
                buildFilterWidget(),
                const SizedBox(
                  height: 10,
                ),
                Column(
                  children: [
                    if (controller.showStories.value)
                      ...controller.stories.map((e) => StoryTileWidget(
                          title:
                              '${controller.selectedProject!.title} - ${e.title}',
                          description: '${e.description}',
                          onTap: () {
                            Get.to(() => const StoryOverviewScreen(),
                                arguments: e);
                          },
                          isCompleted: e.completed == "1"))
                    else
                      ...controller.epics.map(
                        (e) => EpicTileWidget(
                            title:
                                '${controller.selectedProject!.title} - ${e.title}',
                            description: '${e.description}'),
                      )
                  ],
                )
              ],
            ),
          ],
        ),
      );
    } else {
      return buildEmptyStoryState();
    }
  }

  buildEmptyStoryState() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        children: [
          Column(
            children: [
              SizedBox(
                height: Get.height * 0.03,
              ),
              buildFilterWidget(),
              const SizedBox(
                height: 10,
              ),
              Text(
                controller.storyEmptyText.value,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ],
      ),
    );
  }

  buildFilterWidget() {
    return Row(
      children: [
        Expanded(
          child: DropdownButtonFormField2(
            decoration: const InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              border: OutlineInputBorder(),
            ),
            isExpanded: true,
            hint: const Text(
              'Please select a project',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            icon: const Icon(
              Icons.keyboard_arrow_down,
              color: Colors.black,
            ),
            iconSize: 20,
            buttonHeight: 60,
            buttonPadding: const EdgeInsets.only(left: 0, right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
            // value: getDashboardController.projects.first,
            items: controller.projects
                .map((projects) => DropdownMenuItem<Project>(
                      value: projects,
                      child: Text(
                        projects.title ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ))
                .toList(),
            validator: (value) {
              if (value == null) {
                return 'Please select project.';
              }
              return null;
            },
            onChanged: (value) {
              controller.storyEmptyText.value = '';
              controller.selectedProject = value as Project;
              controller.getProjectStories();
            },
            onSaved: (value) {},
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        GestureDetector(
          onTap: () {
            toggleSortOverlay();
          },
          child: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              'assets/images/icon_filter.png',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            toggleOverlay();
          },
          child: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              'assets/images/icon_filter2.png',
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  showFilterOverlay() {
    controller.filterOverlayState = Overlay.of(controller.context!);
    controller.filterOverlayEntry = OverlayEntry(
        builder: (context) => Obx(() => FilterWidget(
            isStorySelected: controller.isStorySelected.value,
            isEpicSelected: controller.isEpicSelected.value,
            onStorySelected: () {
              if (controller.isStorySelected.value) {
                controller.isStorySelected(false);
              } else {
                controller.isStorySelected(true);
                controller.isEpicSelected(false);
              }
              controller.update();
            },
            onEpicSelected: () {
              if (controller.isEpicSelected.value) {
                controller.isEpicSelected(false);
              } else {
                controller.isEpicSelected(true);
                controller.isStorySelected(false);
              }
            },
            onApplyPressed: () {
              controller.applyFilter();
            },
            onCancelPressed: () {
              toggleOverlay();
            })));
    controller.filterOverlayState!.insert(controller.filterOverlayEntry!);
    // overlayEntry.remove();
  }

  showSortFilterOverlay() {
    controller.sortFilterOverlayState = Overlay.of(controller.context!);
    controller.sortFilterOverlayEntry = OverlayEntry(
        builder: (context) => Obx(() => SortFilterWidget(
            isDateAddedSelected: controller.checkSortType('dateAdded'),
            isLastDateAddedSelected: controller.checkSortType('lastEdited'),
            onDateAddedSelected: () {
              controller.sortType.value = 'dateAdded';
              //                         controller.update();
            },
            onLastDateSelected: () {
              controller.sortType.value = 'lastEdited';
              controller.update();
            },
            onApplyPressed: () {
              controller.applySort();
              toggleSortOverlay();
            },
            onCancelPressed: () {
              toggleSortOverlay();
            })));

    controller.sortFilterOverlayState!
        .insert(controller.sortFilterOverlayEntry!);
    // overlayEntry.remove();
  }

  toggleOverlay() {
    if (!controller.isFilterVisible) {
      controller.isFilterVisible = true;
      showFilterOverlay();
    } else {
      if (controller.filterOverlayState != null) {
        controller.isFilterVisible = false;
        controller.filterOverlayEntry!.remove();
      }
    }
  }

  toggleSortOverlay() {
    if (!controller.isSortFilterVisible) {
      controller.isSortFilterVisible = true;
      showSortFilterOverlay();
    } else {
      if (controller.sortFilterOverlayState != null) {
        controller.isSortFilterVisible = false;
        controller.sortFilterOverlayEntry!.remove();
      }
    }
  }

  buildDoneIcon() {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.green,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text(
          'Done',
          style: TextStyle(
              fontSize: 12, color: Colors.white, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
