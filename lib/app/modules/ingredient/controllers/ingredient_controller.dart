import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:get/get.dart';

class IngredientController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;
  var loadState = false.obs;
  var appResponse = AppResponse().obs;
  var ingredients = Ingredients().obs;

  @override
  void onInit() {
    super.onInit();
    _loadIngredients;
  }

  loadFilterMeals(String label) async {
    loadState.value = true;
    AppResponse appResponse = await _dataSources.getFilterMeals(label);
    loadState.value = false;
    return appResponse;
  }

  get _loadIngredients async {
    state.value = true;
    AppResponse response = await _dataSources.getIngredients;
    if (response.success) {
      ingredients.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }
}
