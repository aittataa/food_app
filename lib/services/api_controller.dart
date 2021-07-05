import 'package:food_app/models/categories.dart';
import 'package:food_app/models/meals.dart';
import 'package:food_app/services/api_manager.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var mealsList = Meals().obs;
  var categoriesList = Categories().obs;
  var titleCategoriesList = Categories().obs;
  @override
  void onInit() {
    loadData;
    super.onInit();
  }

  get loadData async {
    /// TODO : Get Categories
    var categories = await ApiManager.getCategories;
    if (categories != null) categoriesList.value = categories;

    /// TODO : Get Categories String
    var categoriesTitle = await ApiManager.getCategoriesList;
    if (categoriesTitle != null) titleCategoriesList.value = categoriesTitle;
  }
}
