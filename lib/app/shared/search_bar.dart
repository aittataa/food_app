import 'package:flutter/material.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
 
class SearchBar extends StatelessWidget {
  final TextEditingController? searchController;
  final Function(String)? onChanged;
  const SearchBar({Key? key, this.searchController, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [AppConstant.boxShadow],
      ),
      child: TextField(
        onChanged: onChanged,
        controller: searchController,
        textInputAction: TextInputAction.done,
        keyboardType: TextInputType.text,
        cursorColor: AppTheme.mainColor,
        style: TextStyle(
          color: AppTheme.primaryTextColor.withOpacity(.75),
          fontWeight: FontWeight.w900,
        ),
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: AppTheme.mainColor,
          ),
          hintText: AppMessage.searchHint,
          hintStyle: TextStyle(
            color: AppTheme.primaryTextColor.withOpacity(.5),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
