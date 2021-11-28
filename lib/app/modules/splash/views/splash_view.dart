import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/modules/initial/views/initial_view.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: BouncePoint(state: true, color: AppTheme.mainColor),
        nextScreen: InitialView(),
        curve: AppConstant.curve,
        backgroundColor: AppTheme.primaryBackColor,
        splashTransition: SplashTransition.fadeTransition,
        animationDuration: AppConstant.durationSplash,
        splashIconSize: double.infinity,
      ),
    );
  }
}
