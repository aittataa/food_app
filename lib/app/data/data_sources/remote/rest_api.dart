class RestApi {
  static const String apiUrl = "https://www.themealdb.com/api/json/v1/1";
  static const String imageUrl = "https://www.themealdb.com/images/ingredients/";

  /// List all meal categories => DONE
  // https://www.themealdb.com/api/json/v1/1/categories.php
  static const String CATEGORIES_API = "/categories.php";

  /// search meal => DONE
  // by name https://www.themealdb.com/api/json/v1/1/search.php?s=Arrabiata
  // by first letter https://www.themealdb.com/api/json/v1/1/search.php?f=a
  static const String SEARCH_API = "/search.php?s=";

  /// meal details => DONE
  // by id i=
  // http://www.themealdb.com/api/json/v1/1/lookup.php?i=52772
  static const String LOOKUP_API = "/lookup.php?";

  /// Lookup a single random meal
  // https://www.themealdb.com/api/json/v1/1/random.php
  static const String RANDOM_API = "/random.php";

  /// List all Categories, Area, Ingredients  => DONE
  // Categories https://www.themealdb.com/api/json/v1/1/list.php?c=list
  // Area https://www.themealdb.com/api/json/v1/1/list.php?a=list
  // Ingredients https://www.themealdb.com/api/json/v1/1/list.php?i=list
  static const String LIST_API = "/list.php?";

  /// Filter by Categories, Area, mainIngredients => DONE
  // Area https://www.themealdb.com/api/json/v1/1/filter.php?a=Canadian
  // Categories https://www.themealdb.com/api/json/v1/1/filter.php?c=Seafood
  // Ingredients https://www.themealdb.com/api/json/v1/1/filter.php?i=chicken_breast
  static const String FILTER_API = "/filter.php?";
}
