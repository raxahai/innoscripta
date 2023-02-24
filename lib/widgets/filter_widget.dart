import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/filter_item.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget(
      {super.key,
      required this.isStorySelected,
      required this.isEpicSelected,
      required this.onStorySelected,
      required this.onEpicSelected,
      required this.onApplyPressed,
      required this.onCancelPressed});

  final bool isStorySelected;
  final VoidCallback onStorySelected;
  final bool isEpicSelected;
  final VoidCallback onEpicSelected;

  final VoidCallback onApplyPressed;
  final VoidCallback onCancelPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * 0.25,
      right: 12,
      left: 12,
      child: Card(
        child: Container(
            color: Colors.white,
            child: SizedBox(
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          DefaultTextStyle(
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: AppTheme.darkBlue),
                            child: Text('Filters'),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Divider(
                        color: AppTheme.grayUnselected,
                      ),
                      FilterItem(
                        title: "Stories",
                        isSelected: isStorySelected,
                        onClick: onStorySelected,
                      ),
                      FilterItem(
                          title: "Epic",
                          isSelected: isEpicSelected,
                          onClick: onEpicSelected),
                      FilterItem(
                          title: "Tasks", isSelected: false, onClick: () {}),
                      Row(
                        children: [
                          SizedBox(
                            width: 180,
                            child: CustomButton(
                                title: 'Apply',
                                onButtonPressed: onApplyPressed),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          TextButton(
                            onPressed: onCancelPressed,
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
                ))),
      ),
    );
  }
}
