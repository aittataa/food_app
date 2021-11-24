import 'package:get/get.dart';

import 'package:food_app/app/modules/home/bindings/home_binding.dart';
import 'package:food_app/app/modules/home/views/home_view.dart';
import 'package:food_app/app/modules/initial/bindings/initial_binding.dart';
import 'package:food_app/app/modules/initial/views/initial_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.INITIAL,
      page: () => InitialView(),
      binding: InitialBinding(),
    ),
  ];
}
