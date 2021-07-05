import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.white,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.dark,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.dark,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(FoodFirst());
}

class FoodFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.appTitle,
      themeMode: ThemeMode.light,
      color: mainColor,
      theme: ThemeData(
        primaryColor: backColor,
        scaffoldBackgroundColor: backColor,
      ),
      home: HomeScreen(),
      // home: Splash(),
      /*
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        ProductsScreen.id: (context) => ProductsScreen(),
        ProductDetails.id: (context) => ProductDetails(),
        ShoppingScreen.id: (context) => ShoppingScreen(),
      },
      */
    );
  }
}
