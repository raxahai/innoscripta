import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/screens/story_overview/presentation/controller/story_overview_controller.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/core/utils/validators.dart';
import 'package:innoscripta/widgets/comment_widget.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/dashboard_appbar.dart';
import 'package:innoscripta/widgets/input_field.dart';
import 'package:innoscripta/widgets/loader_widget.dart';

class StoryOverviewScreen extends StatelessWidget {
  const StoryOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    StoryOverviewController controller = Get.put(StoryOverviewController());
    return Obx(
      () => LoaderWidget(
        isLoading: controller.isLoading.value,
        child: Scaffold(
          appBar: const DashboardAppBar(),
          backgroundColor: AppTheme.lightBlue,
          body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: ListView(children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 25),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Story #${controller.story?.objectiveId ?? ''}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w700),
                        ),
                        const Spacer(),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Image.asset(
                            'assets/images/icon_close.png',
                            height: 32,
                            width: 32,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                color: AppTheme.lightBlue,
                child: Form(
                  key: controller.createProjectForm,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      if (controller.story != null)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0),
                          child: SizedBox(
                            width: 140,
                            child: controller.story?.completed == "0"
                                ? CustomButton(
                                    title: 'Set as done',
                                    onButtonPressed: (() {
                                      controller.setDoneStatus(1);
                                    }))
                                : CustomButton(
                                    title: 'Undo done',
                                    onButtonPressed: (() {
                                      controller.setDoneStatus(0);
                                    })),
                          ),
                        ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Divider(
                        color: AppTheme.grayUnselected,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: InputField(
                          textInputAction: TextInputAction.done,
                          title: 'Description',
                          hintText: 'description goes here',
                          textEditingController:
                              controller.descriptionController,
                          validator: Validators.fieldRequired,
                          onSubmit: () {
                            controller.updateStory('description',
                                controller.descriptionController.text);
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: InputField(
                          title: 'Acceptance criteria / Definition of done',
                          hintText:
                              'Describe your acceptance criteria and or your D.O.D.',
                          textEditingController: controller.dodController,
                          validator: Validators.fieldRequired,
                          maxLines: null,
                          keyboardType: TextInputType.multiline,
                          minLines: 3,
                          onSubmit: () {
                            controller.updateStory('acceptance_criteria',
                                controller.dodController.text);
                          },
                          textInputAction: TextInputAction.done,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: InputField(
                            title: 'Comments',
                            hintText: 'Add a comment',
                            textInputAction: TextInputAction.done,
                            textEditingController: controller.commentController,
                            validator: Validators.fieldRequired,
                            onSubmit: () {
                              controller.submitComment();
                            }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Column(
                          children: [
                            ...controller.comments.map((e) => Column(
                                  children: [
                                    CommentWidget(
                                        name: e.userName ?? '',
                                        comment: e.comment ?? ''),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                  ],
                                )),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
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
