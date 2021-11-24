import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadSearchMeals(String label) async {
    state.value = true;
    AppResponse appResponse = await _dataSources.getSearchMeals(label);
    state.value = false;
    return appResponse;
  }
}
