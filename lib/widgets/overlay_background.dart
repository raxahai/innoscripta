import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:innoscripta/core/utils/app_theme.dart';

class BackgroundOverlay extends StatelessWidget {
  const BackgroundOverlay(
      {Key? key, required this.child, required this.grayHeight})
      : super(key: key);
  final Widget child;
  final double grayHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Container(
            height: 50,
            color: AppTheme.colorGray,
          ),
          Image.asset(
            'assets/images/gray_overlay.png',
            width: Get.width,
            height: Get.height * grayHeight,
            fit: BoxFit.fill,
          ),
          child
        ],
      ),
    );
  }
}
