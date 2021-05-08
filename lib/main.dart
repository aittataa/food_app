import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_app/constant/constant.dart';
import 'package:food_app/screens/categories_screen.dart';
import 'package:food_app/screens/home_screen.dart';
import 'package:food_app/screens/product_details.dart';
import 'package:food_app/screens/products_screen.dart';
import 'package:food_app/screens/shopping_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(FoodFirst());
}

class FoodFirst extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constant.appTitle,
      themeMode: ThemeMode.light,
      color: mainColor,
      theme: ThemeData(
        primaryColor: backColor,
        scaffoldBackgroundColor: backColor,
      ),
      home: HomeScreen(),
      routes: {
        HomeScreen.id: (context) => HomeScreen(),
        CategoriesScreen.id: (context) => CategoriesScreen(),
        ProductsScreen.id: (context) => ProductsScreen(),
        ProductDetails.id: (context) => ProductDetails(),
        ShoppingScreen.id: (context) => ShoppingScreen(),
      },
    );
  }
}
