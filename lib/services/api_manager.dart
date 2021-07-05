import 'package:food_app/models/categories.dart';
import 'package:food_app/models/meals.dart';
import 'package:food_app/services/api_url.dart';
import 'package:http/http.dart' as http;

class ApiManager {
  static getById(String id) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.LOOKUP_API}i=$id");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByName(String name) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.SEARCH_API}s=$name");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByFirstLetter(String letter) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.SEARCH_API}f=$letter");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static get getByRandom async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.RANDOM_API}");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByCategory(String category) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.FILTER_API}c=$category");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByArea(String area) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.FILTER_API}a=$area");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static getByMainIngredient(String ingredient) async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.FILTER_API}i=$ingredient");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static get getCategories async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.CATEGORIES_API}");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return categoriesFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static get getCategoriesList async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.LIST_API}c=list");
    // try {
    var response = await http.get(api);
    if (response.statusCode == 200) {
      // print(api.toString());
      // print(response.body);
      return categoriesFromJson(response.body);
    } else {
      throw Exception("No Data Found");
    }
    // } catch (e) {
    //   throw Exception("Something wrong");
    // }
  }

  static get getAriasList async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.LIST_API}a=list");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }

  static get getIngredientsList async {
    final Uri api = Uri.parse("${ApiUrl.REST_URL}/${ApiUrl.LIST_API}a=list");
    try {
      var response = await http.get(api);
      if (response.statusCode == 200) {
        return mealsFromJson(response.body);
      } else {
        throw Exception("No Data Found");
      }
    } catch (e) {
      throw Exception("Something wrong");
    }
  }
}
