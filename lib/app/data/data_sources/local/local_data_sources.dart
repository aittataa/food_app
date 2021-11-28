import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataSources extends GetConnect {
  late SharedPreferences _session;

  @override
  void onInit() async {
    _session = await SharedPreferences.getInstance();
  }

  getFavorite(String id) {
    return _session.getBool(id);
  }

  setFavorite(String id, bool state) async {
    return await _session.setBool(id, state);
  }

  get getAllFavorite {
    return _session.getKeys();
  }
}
