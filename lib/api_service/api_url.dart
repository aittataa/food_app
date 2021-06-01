class ApiUrl {
  static const String REST_URL = "www.themealdb.com/api/json/v1/1";

  /// TODO : search meal
  //by name s=
  //by first letter f=
  static const String SEARCH_API = "/search.php?";

  /// TODO :  meal details by
  //by id i=
  static const String LOOKUP_API = "/lookup.php?";

  /// TODO :  Lookup a single random meal
  static const String RANDOM_API = "/random.php";

  /// TODO :  List all meal categories
  static const String CATEGORIES_API = "/categories.php?";

  /// TODO :  List all Categories, Area, Ingredients
  // Categories c=list
  // Area a=list
  // Ingredients i=list
  static const String LIST_API = "/list.php?";

  /// TODO :  Filter by Categories, Area, mainIngredients
  // Categories c=
  // Area a=
  // Ingredients i=
  static const String FILTER_API = "/filter.php?";
}
