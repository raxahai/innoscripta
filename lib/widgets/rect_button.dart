import 'package:flutter/material.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class RectButton extends StatelessWidget {
  final String title;
  final Function() onPressed;
  final Color? color;

  const RectButton(
      {Key? key,
      required this.title,
      required this.onPressed,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 45.0,
      child: MaterialButton(
        color: color ?? AppTheme.colorPrimary,
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
