import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/rest_api.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteDataSources extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = RestApi.apiUrl;
  }

  _getUrl(String type) {
    return Uri.parse("${httpClient.baseUrl}$type");
  }

  getSearchMeals(String label) async {
    final Uri uri = _getUrl(RestApi.SEARCH_API + label);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);

    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: mealsFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getCategoriesTitle() async {
    final Uri uri = _getUrl(RestApi.LIST_API + "c=list");
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);

    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: categoriesFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getCategories() async {
    final Uri uri = _getUrl(RestApi.CATEGORIES_API);
    final response = await http.get(uri);
    AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: categoriesFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }
}
