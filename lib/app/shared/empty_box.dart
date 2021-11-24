import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/themes/app_theme.dart';

class EmptyBox extends StatelessWidget {
  const EmptyBox({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        AppMessage.noDataFound,
        style: TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.w900,
          fontSize: 16,
        ),
      ),
    );
  }
}
