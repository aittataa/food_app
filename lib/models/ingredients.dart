import 'dart:convert';

Ingredients ingredientFromJson(String str) => Ingredients.fromJson(json.decode(str));

String ingredientToJson(Ingredients data) => json.encode(data.toJson());

class Ingredients {
  final List<Ingredient> ingredients;
  Ingredients({this.ingredients});

  factory Ingredients.fromJson(Map<String, dynamic> json) {
    return Ingredients(
      ingredients: List<Ingredient>.from(json["meals"].map((x) => Ingredient.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "meals": List<dynamic>.from(ingredients.map((x) => x.toJson())),
    };
  }
}

class Ingredient {
  final String idIngredient;
  final String strIngredient;
  final String strDescription;
  final String strType;

  Ingredient({
    this.idIngredient,
    this.strIngredient,
    this.strDescription,
    this.strType,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      idIngredient: json["idIngredient"],
      strIngredient: json["strIngredient"],
      strDescription: json["strDescription"],
      strType: json["strType"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idIngredient": idIngredient,
      "strIngredient": strIngredient,
      "strDescription": strDescription == null ? null : strDescription,
      "strType": strType == null ? null : strType,
    };
  }
}
