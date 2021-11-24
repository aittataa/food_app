import 'dart:convert';

Categories categoriesFromJson(String str) =>
    Categories.fromJson(json.decode(str));

class Categories {
  final List<Category>? myList;
  final List<Category>? titles;

  Categories({this.myList, this.titles});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      myList: json["categories"] == null
          ? null
          : List<Category>.from(
              json["categories"].map((x) => Category.fromJson(x))),
      titles: json["meals"] == null
          ? null
          : List<Category>.from(
              json["meals"].map((x) => Category.fromJson(x))),
    );
  }
}

class Category {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json["idCategory"] == null ? null : json["idCategory"],
      strCategory: json["strCategory"] == null ? null : json["strCategory"],
      strCategoryThumb:
          json["strCategoryThumb"] == null ? null : json["strCategoryThumb"],
      strCategoryDescription: json["strCategoryDescription"] == null
          ? null
          : json["strCategoryDescription"],
    );
  }
}
