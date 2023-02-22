import 'package:flutter/material.dart';
import 'package:innoscripta/utils/app_theme_consts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {super.key, required this.title, required this.onButtonPressed});

  final String title;
  final VoidCallback onButtonPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onButtonPressed,
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          backgroundColor: AppTheme.colorPrimary),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 12),
        child: Text(
          title,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
