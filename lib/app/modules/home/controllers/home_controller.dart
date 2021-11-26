import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;
  var loadState = false.obs;
  var appResponse = AppResponse().obs;
  var areasTitle = Meals().obs;

  @override
  void onInit() {
    super.onInit();
    _loadAreasTitle;
  }

  loadFilterMeals(String label) async {
    loadState.value = true;
    AppResponse appResponse = await _dataSources.getFilterMeals(label);
    loadState.value = false;
    return appResponse;
  }

  get _loadAreasTitle async {
    state.value = true;
    final AppResponse response = await _dataSources.getListTitles("a");
    if (response.success) {
      areasTitle.value = response.response;
    }
    appResponse.value = response;
    state.value = false;
  }
}
