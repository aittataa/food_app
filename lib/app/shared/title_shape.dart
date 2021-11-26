import 'package:flutter/material.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/themes/app_theme.dart';

class TitleShape extends StatelessWidget {
  final String label;
  final bool state;
  final Function()? onTap;
  const TitleShape({
    Key? key,
    required this.label,
    required this.state,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: AppConstant.durationContainer,
        curve: AppConstant.curve,
        margin: EdgeInsets.symmetric(horizontal: 1),
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: state ? AppTheme.mainColor : AppTheme.transparentColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.75),
            fontWeight: FontWeight.w900,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }
}
