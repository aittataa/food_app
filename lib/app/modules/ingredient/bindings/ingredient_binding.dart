import 'package:get/get.dart';

import '../controllers/ingredient_controller.dart';

class IngredientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IngredientController>(
      () => IngredientController(),
    );
  }
}
