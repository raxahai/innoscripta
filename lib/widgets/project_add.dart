import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:innoscripta/core/dto/project/project_list_response_model.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class ProjectAdd extends StatelessWidget {
  const ProjectAdd(
      {super.key,
      required this.projects,
      required this.epicCount,
      required this.taskCount,
      required this.storyCount,
      required this.onEpicAdd,
      required this.onStoryAdd,
      required this.onTaskAdd,
      required this.onProjectSelected,
      this.selectedProject,
      required this.onNewProjec,
      required this.onNewSprint});

  final List<Project> projects;
  final int epicCount;
  final int taskCount;
  final int storyCount;
  final VoidCallback onEpicAdd;
  final VoidCallback onStoryAdd;
  final VoidCallback onTaskAdd;
  final VoidCallback onNewProjec;
  final VoidCallback onNewSprint;

  final Function(Project v) onProjectSelected;
  final Project? selectedProject;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField2(
                decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.zero,
                  border: OutlineInputBorder(),
                ),
                isExpanded: true,
                hint: const Text(
                  'Select Your Project',
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
                value: selectedProject,
                items: projects
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
                  // var abc = value;
                  onProjectSelected(value as Project);
                },
                onSaved: (value) {},
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Text(
                      'Epics($epicCount)',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onEpicAdd,
                      child: Image.asset(
                        'assets/images/add.png',
                        // height: 25,
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppTheme.grayUnselected,
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Row(
                  children: [
                    Text(
                      'Stories($storyCount)',
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onStoryAdd,
                      child: Image.asset(
                        'assets/images/add.png',
                        // height: 25,
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
              const Divider(
                color: AppTheme.grayUnselected,
              ),
              // SizedBox(
              //   height: 20,
              // ),
              // Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
              //   child: Row(
              //     children: [
              //       Text(
              //         'Tasks(0)',
              //         style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              //       ),
              //       Spacer(),
              //       GestureDetector(
              //         onTap: onTaskAdd,
              //         child: Image.asset(
              //           'assets/add.png',
              //           // height: 25,
              //           width: 40,
              //         ),
              //       )
              //     ],
              //   ),
              // ),
              // Divider(
              //   color: AppTheme.grayUnselected,
              // ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 5.0),
                child: Row(
                  children: [
                    const Text(
                      'Sprints(0)',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: onNewSprint,
                      child: Image.asset(
                        'assets/images/add.png',
                        // height: 25,
                        width: 40,
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(18)),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppTheme.colorPrimary),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                            side: const BorderSide(
                                color: AppTheme.colorPrimary)))),
                onPressed: onNewProjec,
                child: const Text('Or create new project',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
