import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/modules/categories/bindings/categories_binding.dart';
import 'package:food_app/app/modules/categories/views/categories_view.dart';
import 'package:food_app/app/modules/details/bindings/details_binding.dart';
import 'package:food_app/app/modules/details/views/details_view.dart';
import 'package:food_app/app/modules/display/bindings/display_binding.dart';
import 'package:food_app/app/modules/display/views/display_view.dart';
import 'package:food_app/app/modules/favorite/bindings/favorite_binding.dart';
import 'package:food_app/app/modules/favorite/views/favorite_view.dart';
import 'package:food_app/app/modules/home/bindings/home_binding.dart';
import 'package:food_app/app/modules/home/views/home_view.dart';
import 'package:food_app/app/modules/ingredient/bindings/ingredient_binding.dart';
import 'package:food_app/app/modules/ingredient/views/ingredient_view.dart';
import 'package:food_app/app/modules/initial/bindings/initial_binding.dart';
import 'package:food_app/app/modules/initial/views/initial_view.dart';
import 'package:food_app/app/modules/search/bindings/search_binding.dart';
import 'package:food_app/app/modules/search/views/search_view.dart';
import 'package:food_app/app/modules/splash/bindings/splash_binding.dart';
import 'package:food_app/app/modules/splash/views/splash_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.SEARCH,
      page: () => SearchView(),
      binding: SearchBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.CATEGORIES,
      page: () => CategoriesView(),
      binding: CategoriesBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.DISPLAY,
      page: () => DisplayView(),
      binding: DisplayBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.DETAILS,
      page: () => DetailsView(),
      binding: DetailsBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.INGREDIENT,
      page: () => IngredientView(),
      binding: IngredientBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
    GetPage(
      name: _Paths.FAVORITE,
      page: () => FavoriteView(),
      binding: FavoriteBinding(),
      curve: AppConstant.curve,
      transitionDuration: AppConstant.durationRoute,
      transition: AppConstant.transitionRoute,
    ),
  ];
}
