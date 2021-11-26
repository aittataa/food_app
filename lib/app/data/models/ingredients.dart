import 'dart:convert';

Ingredients ingredientsFromJson(String str) => Ingredients.fromJson(json.decode(str));

class Ingredients {
  final List<Ingredient>? myList;
  Ingredients({this.myList});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      myList: json["meals"] == null ? null : List<Ingredient>.from(json["meals"].map((x) => Ingredient.fromJson(x))),
    );
  }
}

class Ingredient {
  final String? idIngredient;
  final String? strIngredient;
  final String? strDescription;
  final String? strType;

  Ingredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      idIngredient: json["idIngredient"] == null ? null : json["idIngredient"],
      strIngredient: json["strIngredient"] == null ? null : json["strIngredient"],
      strDescription: json["strDescription"] == null ? null : json["strDescription"],
      strType: json["strType"] == null ? null : json["strType"],
    );
  }
}
