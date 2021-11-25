import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/themes/app_theme.dart';

class NavigationBar extends StatelessWidget {
  final int currentIndex;
  final Function(int)? onTap;
  const NavigationBar({
    Key? key,
    required this.currentIndex,
    this.onTap,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: onTap,
      currentIndex: currentIndex,
      //elevation: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppTheme.primaryBackColor,
      selectedItemColor: AppTheme.mainColor,
      unselectedItemColor: AppTheme.primaryIconColor.withOpacity(.5),
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w900),
      showUnselectedLabels: false,
      items: const [
        BottomNavigationBarItem(
          label: AppMessage.labelHome,
          icon: Icon(CupertinoIcons.house_alt),
          activeIcon: Icon(CupertinoIcons.house_alt_fill),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelSearch,
          icon: Icon(CupertinoIcons.search),
          activeIcon: Icon(CupertinoIcons.search),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelCategories,
          icon: Icon(CupertinoIcons.layers_alt),
          activeIcon: Icon(CupertinoIcons.layers_alt_fill),
        ),
        BottomNavigationBarItem(
          label: AppMessage.labelIngredients,
          icon: Icon(CupertinoIcons.rectangle_stack_badge_plus),
          activeIcon: Icon(CupertinoIcons.rectangle_stack_fill_badge_plus),
        ),
      ],
    );
  }
}
