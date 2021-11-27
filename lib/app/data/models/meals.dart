import 'dart:convert';

import 'package:food_app/app/data/data_sources/remote/rest_api.dart';

Meals mealsFromJson(String str) => Meals.fromJson(json.decode(str));

class Meals {
  final List<Meal>? myList;

  Meals({this.myList});

  factory Meals.fromJson(Map<String, dynamic> json) {
    return Meals(
      myList: json["meals"] == null ? null : List<Meal>.from(json["meals"].map((x) => Meal.fromJson(x))),
    );
  }
}

class Meal {
  final String? idMeal;
  final String? strMeal;
  final String? strDrinkAlternate;
  final String? strCategory;
  final String? strArea;
  final String? strInstructions;
  final String? strMealThumb;
  final String? strTags;
  final String? strYoutube;
  final String? strIngredient1;
  final String? strThumbIngredient1;
  final String? strIngredient2;
  final String? strThumbIngredient2;
  final String? strIngredient3;
  final String? strThumbIngredient3;
  final String? strIngredient4;
  final String? strThumbIngredient4;
  final String? strIngredient5;
  final String? strThumbIngredient5;
  final String? strIngredient6;
  final String? strThumbIngredient6;
  final String? strIngredient7;
  final String? strThumbIngredient7;
  final String? strIngredient8;
  final String? strThumbIngredient8;
  final String? strIngredient9;
  final String? strThumbIngredient9;
  final String? strIngredient10;
  final String? strThumbIngredient10;
  final String? strIngredient11;
  final String? strThumbIngredient11;
  final String? strIngredient12;
  final String? strThumbIngredient12;
  final String? strIngredient13;
  final String? strThumbIngredient13;
  final String? strIngredient14;
  final String? strThumbIngredient14;
  final String? strIngredient15;
  final String? strThumbIngredient15;
  final String? strIngredient16;
  final String? strThumbIngredient16;
  final String? strIngredient17;
  final String? strThumbIngredient17;
  final String? strIngredient18;
  final String? strThumbIngredient18;
  final String? strIngredient19;
  final String? strThumbIngredient19;
  final String? strIngredient20;
  final String? strThumbIngredient20;
  final String? strMeasure1;
  final String? strMeasure2;
  final String? strMeasure3;
  final String? strMeasure4;
  final String? strMeasure5;
  final String? strMeasure6;
  final String? strMeasure7;
  final String? strMeasure8;
  final String? strMeasure9;
  final String? strMeasure10;
  final String? strMeasure11;
  final String? strMeasure12;
  final String? strMeasure13;
  final String? strMeasure14;
  final String? strMeasure15;
  final String? strMeasure16;
  final String? strMeasure17;
  final String? strMeasure18;
  final String? strMeasure19;
  final String? strMeasure20;
  final String? strSource;
  final String? strImageSource;
  final String? strCreativeCommonsConfirmed;
  final String? dateModified;

  Meal({
    this.idMeal,
    this.strMeal,
    this.strDrinkAlternate,
    this.strCategory,
    this.strArea,
    this.strInstructions,
    this.strMealThumb,
    this.strTags,
    this.strYoutube,
    this.strIngredient1,
    this.strThumbIngredient1,
    this.strIngredient2,
    this.strThumbIngredient2,
    this.strIngredient3,
    this.strThumbIngredient3,
    this.strIngredient4,
    this.strThumbIngredient4,
    this.strIngredient5,
    this.strThumbIngredient5,
    this.strIngredient6,
    this.strThumbIngredient6,
    this.strIngredient7,
    this.strThumbIngredient7,
    this.strIngredient8,
    this.strThumbIngredient8,
    this.strIngredient9,
    this.strThumbIngredient9,
    this.strIngredient10,
    this.strThumbIngredient10,
    this.strIngredient11,
    this.strThumbIngredient11,
    this.strIngredient12,
    this.strThumbIngredient12,
    this.strIngredient13,
    this.strThumbIngredient13,
    this.strIngredient14,
    this.strThumbIngredient14,
    this.strIngredient15,
    this.strThumbIngredient15,
    this.strIngredient16,
    this.strThumbIngredient16,
    this.strIngredient17,
    this.strThumbIngredient17,
    this.strIngredient18,
    this.strThumbIngredient18,
    this.strIngredient19,
    this.strThumbIngredient19,
    this.strIngredient20,
    this.strThumbIngredient20,
    this.strMeasure1,
    this.strMeasure2,
    this.strMeasure3,
    this.strMeasure4,
    this.strMeasure5,
    this.strMeasure6,
    this.strMeasure7,
    this.strMeasure8,
    this.strMeasure9,
    this.strMeasure10,
    this.strMeasure11,
    this.strMeasure12,
    this.strMeasure13,
    this.strMeasure14,
    this.strMeasure15,
    this.strMeasure16,
    this.strMeasure17,
    this.strMeasure18,
    this.strMeasure19,
    this.strMeasure20,
    this.strSource,
    this.strImageSource,
    this.strCreativeCommonsConfirmed,
    this.dateModified,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      idMeal: json["idMeal"] == null ? null : json["idMeal"],
      strMeal: json["strMeal"] == null ? null : json["strMeal"],
      strDrinkAlternate: json["strDrinkAlternate"] == null ? null : json["strDrinkAlternate"],
      strCategory: json["strCategory"] == null ? null : json["strCategory"],
      strArea: json["strArea"] == null ? null : json["strArea"],
      strInstructions: json["strInstructions"] == null ? null : json["strInstructions"],
      strMealThumb: json["strMealThumb"] == null ? null : json["strMealThumb"],
      strTags: json["strTags"] == null ? null : json["strTags"],
      strYoutube: json["strYoutube"] == null ? null : json["strYoutube"],
      strSource: json["strSource"] == null ? null : json["strSource"],
      strImageSource: json["strImageSource"] == null ? null : json["strImageSource"],
      strCreativeCommonsConfirmed: json["strCreativeCommonsConfirmed"],
      dateModified: json["dateModified"],
      strIngredient1: json["strIngredient1"] == null ? null : json["strIngredient1"],
      strThumbIngredient1: "${RestApi.imageUrl}${json["strIngredient1"]}.png",
      strIngredient2: json["strIngredient2"] == null ? null : json["strIngredient2"],
      strThumbIngredient2: "${RestApi.imageUrl}${json["strIngredient2"]}.png",
      strIngredient3: json["strIngredient3"] == null ? null : json["strIngredient3"],
      strThumbIngredient3: "${RestApi.imageUrl}${json["strIngredient3"]}.png",
      strIngredient4: json["strIngredient4"] == null ? null : json["strIngredient4"],
      strThumbIngredient4: "${RestApi.imageUrl}${json["strIngredient4"]}.png",
      strIngredient5: json["strIngredient5"] == null ? null : json["strIngredient5"],
      strThumbIngredient5: "${RestApi.imageUrl}${json["strIngredient5"]}.png",
      strIngredient6: json["strIngredient6"] == null ? null : json["strIngredient6"],
      strThumbIngredient6: "${RestApi.imageUrl}${json["strIngredient6"]}.png",
      strIngredient7: json["strIngredient7"] == null ? null : json["strIngredient7"],
      strThumbIngredient7: "${RestApi.imageUrl}${json["strIngredient7"]}.png",
      strIngredient8: json["strIngredient8"] == null ? null : json["strIngredient8"],
      strThumbIngredient8: "${RestApi.imageUrl}${json["strIngredient8"]}.png",
      strIngredient9: json["strIngredient9"] == null ? null : json["strIngredient9"],
      strThumbIngredient9: "${RestApi.imageUrl}${json["strIngredient9"]}.png",
      strIngredient10: json["strIngredient10"] == null ? null : json["strIngredient10"],
      strThumbIngredient10: "${RestApi.imageUrl}${json["strIngredient10"]}.png",
      strIngredient11: json["strIngredient11"] == null ? null : json["strIngredient11"],
      strThumbIngredient11: "${RestApi.imageUrl}${json["strIngredient11"]}.png",
      strIngredient12: json["strIngredient12"] == null ? null : json["strIngredient12"],
      strThumbIngredient12: "${RestApi.imageUrl}${json["strIngredient12"]}.png",
      strIngredient13: json["strIngredient13"] == null ? null : json["strIngredient13"],
      strThumbIngredient13: "${RestApi.imageUrl}${json["strIngredient13"]}.png",
      strIngredient14: json["strIngredient14"] == null ? null : json["strIngredient14"],
      strThumbIngredient14: "${RestApi.imageUrl}${json["strIngredient14"]}.png",
      strIngredient15: json["strIngredient15"] == null ? null : json["strIngredient15"],
      strThumbIngredient15: "${RestApi.imageUrl}${json["strIngredient15"]}.png",
      strIngredient16: json["strIngredient16"] == null ? null : json["strIngredient16"],
      strThumbIngredient16: "${RestApi.imageUrl}${json["strIngredient16"]}.png",
      strIngredient17: json["strIngredient17"] == null ? null : json["strIngredient17"],
      strThumbIngredient17: "${RestApi.imageUrl}${json["strIngredient17"]}.png",
      strIngredient18: json["strIngredient18"] == null ? null : json["strIngredient18"],
      strThumbIngredient18: "${RestApi.imageUrl}${json["strIngredient18"]}.png",
      strIngredient19: json["strIngredient19"] == null ? null : json["strIngredient19"],
      strThumbIngredient19: "${RestApi.imageUrl}${json["strIngredient19"]}.png",
      strIngredient20: json["strIngredient20"] == null ? null : json["strIngredient20"],
      strThumbIngredient20: "${RestApi.imageUrl}${json["strIngredient20"]}.png",
      strMeasure1: json["strMeasure1"] == null ? null : json["strMeasure1"],
      strMeasure2: json["strMeasure2"] == null ? null : json["strMeasure2"],
      strMeasure3: json["strMeasure3"] == null ? null : json["strMeasure3"],
      strMeasure4: json["strMeasure4"] == null ? null : json["strMeasure4"],
      strMeasure5: json["strMeasure5"] == null ? null : json["strMeasure5"],
      strMeasure6: json["strMeasure6"] == null ? null : json["strMeasure6"],
      strMeasure7: json["strMeasure7"] == null ? null : json["strMeasure7"],
      strMeasure8: json["strMeasure8"] == null ? null : json["strMeasure8"],
      strMeasure9: json["strMeasure9"] == null ? null : json["strMeasure9"],
      strMeasure10: json["strMeasure10"] == null ? null : json["strMeasure10"],
      strMeasure11: json["strMeasure11"] == null ? null : json["strMeasure11"],
      strMeasure12: json["strMeasure12"] == null ? null : json["strMeasure12"],
      strMeasure13: json["strMeasure13"] == null ? null : json["strMeasure13"],
      strMeasure14: json["strMeasure14"] == null ? null : json["strMeasure14"],
      strMeasure15: json["strMeasure15"] == null ? null : json["strMeasure15"],
      strMeasure16: json["strMeasure16"] == null ? null : json["strMeasure16"],
      strMeasure17: json["strMeasure17"] == null ? null : json["strMeasure17"],
      strMeasure18: json["strMeasure18"] == null ? null : json["strMeasure18"],
      strMeasure19: json["strMeasure19"] == null ? null : json["strMeasure19"],
      strMeasure20: json["strMeasure20"] == null ? null : json["strMeasure20"],
    );
  }
}
