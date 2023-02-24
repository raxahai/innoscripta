import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/dto/project/comments_list_response_model.dart';
import 'package:innoscripta/core/dto/project/story_list_response_model.dart';

class StoryOverviewController extends GetxController {
  var isLoading = false.obs;
  final createProjectForm = GlobalKey<FormState>();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController dodController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  Story? story;
  var comments = <Comment>[].obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration.zero, () {
      story = Get.arguments;
      descriptionController.text = story?.description ?? '';
      dodController.text = story?.acceptanceCriteria ?? '';
      getComments();
    });
  }

  submitComment() async {
    // try {
    //   var res = await _projectService.addComment(
    //       commentController.text, story!.objectiveId!, story!.projectId!);
    //   getComments();
    //   var dashboardController = Get.find<DashboardController>();
    // } catch (e) {
    //   handleException(e);
    // } finally {}
  }

  getComments() async {
    // try {
    //   CommentsListResponseModel res =
    //       await _projectService.getComments(story!.objectiveId!);
    //   comments.value = res.result!.rows!;
    // } catch (e) {
    //   handleException(e);
    // } finally {}
  }

  setDoneStatus(int status) async {
    // try {
    //   isLoading(true);

    //   StoryUpdateResponseModel _ = await _projectService.setDone(
    //       story!.objectiveId!, story!.projectId!, status);
    //   var dashboardController = Get.find<DashboardController>();
    //   await dashboardController.getProjectStories();
    //   Get.back();
    //   dashboardController.showTopToast('⚡️ Your story has been updated');
    // } catch (e) {
    //   handleException(e);
    // } finally {
    //   isLoading(false);
    // }
  }

  updateStory(String key, String value) async {
    // try {
    //   isLoading(true);
    //   var res = await _projectService.updateStory(
    //       story!.objectiveId!, story!.projectId!, key, value);
    //   var dashboardController = Get.find<DashboardController>();
    //   await dashboardController.getProjectStories();
    //   Get.back();
    //   dashboardController.showTopToast('⚡️ Your story has been updated');
    // } catch (e) {
    //   handleException(e);
    // } finally {
    //   isLoading(false);
    // }
  }
}



  // onSetDone() async {
  //   if (!createProjectForm.currentState!.validate()) return;
  //   isLoading(true);
  //   try {
  //     // var res = await _projectService.createStory();
  //     // var dashboardController = Get.find<DashboardController>();
  //     // Get.offAll(() => (DashboardScreen()));
  //     // dashboardController.getProjects();
  //     // dashboardController.showTopToast('⚡️ Your story is created');
  //   } catch (e) {
  //     Get.defaultDialog(
  //         title: '',
  //         titleStyle: TextStyle(fontSize: 0),
  //         content: GetErrorDialog(title: 'Error', message: e.toString()));
  //   } finally {}
  // }

