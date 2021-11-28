import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:get/get.dart';

class AppConstant {
  AppConstant._();

  /// TODO : Screen Size
  //static double screenWidth = Get.size.width;
  //static double screenHeight = Get.size.height;
  static double screenWidth = Get.width;
  static double screenHeight = Get.height;

  /// TODO : Page Index
  // static int pageIndex = 0;
  // static PageController controller = PageController();

  /// TODO : Curves
  static const Curve curve = Curves.linearToEaseOut;

  /// TODO : Transitions
  static const Transition transitionRoute = Transition.topLevel;

  /// TODO : Durations
  static const Duration durationRoute = Duration(milliseconds: 100);
  static const Duration durationSplash = Duration(milliseconds: 1500);
  static const Duration durationAnimation = Duration(milliseconds: 1000);
  static const Duration durationCheckedBox = Duration(milliseconds: 500);
  static const Duration durationGender = Duration(milliseconds: 250);
  static const Duration durationContainer = Duration(milliseconds: 1000);
  static const Duration duration = Duration(milliseconds: 1500);

  /// TODO : BoxShadow
  static BoxShadow boxShadow = BoxShadow(
    color: AppTheme.shadowColor.withOpacity(.1),
    blurRadius: 10,
    spreadRadius: .1,
  );
}
