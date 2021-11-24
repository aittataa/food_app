import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';

class BackIcon extends StatelessWidget {
  final Function()? onPressed;
  const BackIcon({Key? key, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      //onPressed: () => Get.back(),
      padding: EdgeInsets.zero,
      splashColor: AppTheme.transparentColor,
      highlightColor: AppTheme.transparentColor,
      icon: Icon(CupertinoIcons.back, color: AppTheme.primaryIconColor),
    );
  }
}
