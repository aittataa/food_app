import 'package:food_app/app/data/data_sources/remote/remote_data_sources.dart';
import 'package:get/get.dart';

class InitialController extends GetxController {
  RemoteDataSources _dataSources = Get.put(RemoteDataSources());
  @override
  void onInit() {
    super.onInit();
  
  }



}
