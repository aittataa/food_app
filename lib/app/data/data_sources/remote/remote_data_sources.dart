import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/data_sources/remote/rest_api.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class RemoteDataSources extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = RestApi.apiUrl;
  }

  _getUrl(String type) => Uri.parse("${httpClient.baseUrl}$type");

  getLookupMeal(String id) async {
    final Uri uri = _getUrl("${RestApi.LOOKUP_API}i=$id");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
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

  get getIngredients async {
    final Uri uri = _getUrl("${RestApi.LIST_API}i=list");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
    if (appResponse.success) {
      return AppResponse(
        success: appResponse.success,
        messageServer: appResponse.messageServer,
        messageUser: appResponse.messageUser,
        response: ingredientsFromJson(appResponse.response),
      );
    } else {
      return appResponse;
    }
  }

  getFilterMeals(String label) async {
    final Uri uri = _getUrl(RestApi.FILTER_API + label);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
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

  getSearchMeals(String label) async {
    final Uri uri = _getUrl(RestApi.SEARCH_API + label);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);

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

  getListTitles(String label) async {
    final Uri uri = _getUrl("${RestApi.LIST_API}$label=list");
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
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

  get getCategories async {
    final Uri uri = _getUrl(RestApi.CATEGORIES_API);
    final response = await http.get(uri);
    final AppResponse appResponse = await AppResponse.requestResponse(response);
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
