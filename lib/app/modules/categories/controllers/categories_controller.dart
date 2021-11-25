import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:get/get.dart';

class CategoriesController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;
  var appResponse = AppResponse().obs;
  var categories = Categories().obs;

  @override
  void onInit() {
    super.onInit();
    loadCategories();
  }

  loadCategories() async {
    state.value = true;
    AppResponse response = await _dataSources.getCategories;
    if (response.success) {
      categories.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }
}
