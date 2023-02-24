import 'package:flutter/material.dart';

class AppTheme {
  static const Color colorPrimary = Color(0xff2C6DFA);
  static const Color colorGray = Color(0xffF7F9F9);
  static const Color logoBgColor = Color(0xff19264C);
  static const Color darkBlue = Color(0xff05122A);
  static const Color grayColor = Color(0xffF7F9F9);
  static const Color graySelected = Color(0xffAEB3C0);
  static const Color grayUnselected = Color(0xffD5E0E3);
  static const Color lightBlue = Color(0xffF7FAFF);
  static const Color gray4 = Color(0xff747C92);
  static const Color green = Color(0xff4CAF50);
  static const LinearGradient linearGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      colorPrimary,
      colorGray,
    ],
  );
}
