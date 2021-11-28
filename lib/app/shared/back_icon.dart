import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:get/get.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () => Get.back(),
        padding: EdgeInsets.zero,
        color: AppTheme.primaryIconColor,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(CupertinoIcons.back),
      ),
    );
  }
}
