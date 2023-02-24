import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/create_epic/presentation/controller/create_epic_controller.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/dashboard_appbar.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';

class CreateEpicScreen extends StatelessWidget {
  CreateEpicScreen({super.key});
  final CreateEpicController controller = CreateEpicController();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => LoaderWidget(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          appBar: const DashboardAppBar(),
          backgroundColor: Colors.white,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: SingleChildScrollView(
              child: Column(children: [
                Container(
                  height: 100,
                  color: AppTheme.colorGray,
                  child: const Padding(
                    padding: EdgeInsets.only(left: 20.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Create new epic',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
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
                          title: 'Name your epic',
                          hintText: 'Name your epic',
                          textEditingController: controller.epicNameController,
                          validator: Validators.fieldRequired,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const SizedBox(height: 20),
                        InputField(
                          title: 'Add a description for your story',
                          hintText: 'Description',
                          textEditingController:
                              controller.descriptionController,
                          validator: Validators.fieldRequired,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          minLines: 6,
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
                                  onButtonPressed: (() {
                                    controller.onCreateEpic();
                                  })),
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
      ),
    );
  }
}
