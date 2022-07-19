import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/modules/favorite/views/favorite_view.dart';
import 'package:get/get.dart';

class HeaderButton extends StatelessWidget {
  const HeaderButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.circular(10),
        //boxShadow: [AppConstant.boxShadow],
      ),
      child: IconButton(
        onPressed: () => Get.to(() => FavoriteView()),
        color: AppTheme.secondaryIconColor,
        splashColor: AppTheme.transparentColor,
        highlightColor: AppTheme.transparentColor,
        icon: Icon(CupertinoIcons.heart_fill),
      ),
    );
  }
}
