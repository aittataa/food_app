import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/widgets/bounce_point.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      nextScreen: HomeScreen(),
      splash: BouncePoint(),
      curve: Constant.curve,
      backgroundColor: backColor,
      splashTransition: SplashTransition.fadeTransition,
      animationDuration: Constant.duration,
      splashIconSize: double.infinity,
    );
  }
}
