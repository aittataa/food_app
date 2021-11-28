import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/local/local_data_sources.dart';
import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final LocalDataSources _localDataSources = Get.put(LocalDataSources());
  final RemoteDataSources _remoteDataSources = Get.put(RemoteDataSources());
  var state = false.obs;

  @override
  void onInit() {
    super.onInit();
  }

  loadSearchMeals(String label) async {
    state.value = true;
    AppResponse appResponse = await _remoteDataSources.getSearchMeals(label);
    state.value = false;
    return appResponse;
  }

  getFavorite(String id) {
    return _localDataSources.getFavorite(id);
  }

  setFavorite(String id, bool state) async {
    return await _localDataSources.setFavorite(id, state);
  }
}
