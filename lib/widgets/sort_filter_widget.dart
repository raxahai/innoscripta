import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/utils/app_theme.dart';
import 'package:innoscripta/widgets/custom_button.dart';
import 'package:innoscripta/widgets/filter_item.dart';

class SortFilterWidget extends StatelessWidget {
  const SortFilterWidget(
      {super.key,
      required this.isDateAddedSelected,
      required this.isLastDateAddedSelected,
      required this.onDateAddedSelected,
      required this.onLastDateSelected,
      required this.onApplyPressed,
      required this.onCancelPressed});

  final bool isDateAddedSelected;
  final VoidCallback onDateAddedSelected;

  final bool isLastDateAddedSelected;
  final VoidCallback onLastDateSelected;

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
                            child: Text('Order by'),
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
                          title: "Date added",
                          isSelected: isDateAddedSelected,
                          onClick: onDateAddedSelected),
                      FilterItem(
                          title: "Last edited",
                          isSelected: isLastDateAddedSelected,
                          onClick: onLastDateSelected),
                      FilterItem(
                          title: "Due date", isSelected: false, onClick: () {}),
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
