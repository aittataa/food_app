import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/routes/app_pages.dart';
import 'package:get/get.dart';


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AppFunction.configureDependencies();
  runApp(FoodFirst());
}

class FoodFirst extends StatelessWidget {
  const FoodFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      smartManagement: SmartManagement.full,
      initialRoute: AppPages.INITIAL,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      getPages: AppPages.routes,
    );
  }
}
