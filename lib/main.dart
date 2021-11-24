import 'package:flutter/material.dart';
import 'package:food_app/app/routes/app_pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(FoodFirst());
}

class FoodFirst extends StatelessWidget {
  const FoodFirst({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    );
  }
}
