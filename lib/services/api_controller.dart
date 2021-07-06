import 'package:food_app/models/categories.dart';
import 'package:food_app/models/ingredients.dart';
import 'package:food_app/models/meals.dart';
import 'package:food_app/services/api_manager.dart';
import 'package:get/get.dart';

class ApiController extends GetxController {
  var mealsList = Meals().obs;
  var categoriesTitleList = Meals().obs;
  var areaTitleList = Meals().obs;
  var categoriesList = Categories().obs;
  var ingredientList = Ingredients().obs;
  @override
  void onInit() {
    loadData;
    super.onInit();
  }

  get loadData async {
    /// TODO : Get Categories
    var categories = await ApiManager.getCategories;
    if (categories != null) categoriesList.value = categories;

    /// TODO : Get Categories String Title
    var categoriesTitle = await ApiManager.getCategoriesList;
    if (categoriesTitle != null) categoriesTitleList.value = categoriesTitle;

    /// TODO : Get Area String Title
    var areaTitle = await ApiManager.getAriasList;
    if (areaTitle != null) areaTitleList.value = areaTitle;

    /// TODO : Ingredients
    var ingredients = await ApiManager.getIngredientsList;
    if (ingredients != null) ingredientList.value = ingredients;
  }
}
