import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:innoscripta/core/utils/app_theme_consts.dart';
import 'package:innoscripta/widgets/custom_button.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({super.key, required this.title, required this.message});

  final String title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(40),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Center(
                child: Image.asset(
                  'assets/images/errorCircle.png',
                  height: 50,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style:
                    const TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              ),
              const Divider(
                color: AppTheme.grayUnselected,
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                message ?? "",
                style:
                    const TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              const SizedBox(
                height: 15,
              ),
              CustomButton(
                  title: 'Got it',
                  onButtonPressed: () {
                    Get.back();
                  })
            ],
          ),
        ),
      ),
    );
  }
}
