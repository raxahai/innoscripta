import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class StoryTileWidget extends StatelessWidget {
  const StoryTileWidget(
      {super.key,
      required this.title,
      required this.description,
      required this.onTap,
      required this.isCompleted});

  final VoidCallback onTap;
  final String title;
  final String description;
  final bool isCompleted;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        key: UniqueKey(),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppTheme.grayUnselected,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
              child: Row(
                children: [
                  Image.asset(
                    height: 20,
                    width: 20,
                    'assets/images/icon_radioButton.png',
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: AppTheme.graySelected),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SizedBox(
                        width: Get.width * 0.55,
                        child: Text(
                          description,
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  if (isCompleted) buildDoneIcon()
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
