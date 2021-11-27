import 'package:food_app/app/data/data_sources/local/local_data_sources.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {
  final LocalDataSources _dataSources = Get.put(LocalDataSources());
  @override
  void onInit() {
    super.onInit();
  }

  getFavorite(String id) async {
    return await _dataSources.getFavorite(id);
  }

  setFavorite(String id, bool state) async {
    return await _dataSources.setFavorite(id, state);
  }
}
