import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/modules/initial/views/initial_view.dart';
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
      defaultTransition: Transition.noTransition,
      smartManagement: SmartManagement.full,
      debugShowCheckedModeBanner: false,
      title: AppMessage.appTitle,
      theme: AppTheme.themeData,
      home: InitialView(),
      // initialRoute: AppPages.INITIAL,
      // getPages: AppPages.routes,
    );
  }
}
