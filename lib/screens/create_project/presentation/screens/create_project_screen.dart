import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/create_project/presentation/controller/create_project_controller.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/dashboard_appbar.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';
import 'package:innoscripta/widgets/project_mehtod_selector.dart';

class CreateProjectScreen extends StatelessWidget {
  CreateProjectScreen({Key? key}) : super(key: key);
  final CreateProjectcontroller controller = CreateProjectcontroller();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderWidget(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          appBar: const DashboardAppBar(),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 100,
                color: AppTheme.colorGray,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Create new project',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 35,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Form(
                  key: controller.createProjectForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InputField(
                        title: 'What’s the name of your project',
                        hintText: 'Name your project',
                        textEditingController: controller.projectNameController,
                        validator: Validators.fieldRequired,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      const Text(
                        'Choose your method',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectMethodSelector(
                            title: 'Scrum',
                            isSelected: controller.isScrumSelected.value,
                            onClick: () {
                              controller.onProjectSelected('scrum');
                            },
                          ),
                          ProjectMethodSelector(
                            title: 'Kanban',
                            isSelected: controller.isKanbanSelected.value,
                            onClick: () {
                              controller.onProjectSelected('kanban');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectMethodSelector(
                            title: 'Waterfal',
                            isSelected: controller.isWaterFal.value,
                            onClick: () {
                              controller.onProjectSelected('waterfal');
                            },
                          ),
                          ProjectMethodSelector(
                            title: 'Todo',
                            isSelected: controller.isTodoSeleced.value,
                            onClick: () {
                              controller.onProjectSelected('todo');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ProjectMethodSelector(
                            title: 'Board',
                            isSelected: controller.isBoardSelected.value,
                            onClick: () {
                              controller.onProjectSelected('board');
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: CustomButton(
                                title: 'Create',
                                onButtonPressed: controller.onCreateProject),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: 18, horizontal: 12),
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
