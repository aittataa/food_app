import 'dart:convert';

Categories categoriesFromJson(String str) => Categories.fromJson(json.decode(str));

String categoriesToJson(Categories data) => json.encode(data.toJson());

class Categories {
  List<Category> categories;
  Categories({this.categories});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      categories: List<Category>.from(
        json["categories"].map((x) => Category.fromJson(x)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "categories": List<dynamic>.from(
        categories.map((x) => x.toJson()),
      ),
    };
  }
}

class Category {
  String idCategory;
  String strCategory;
  String strCategoryThumb;
  String strCategoryDescription;

  Category({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      idCategory: json["idCategory"],
      strCategory: json["strCategory"],
      strCategoryThumb: json["strCategoryThumb"],
      strCategoryDescription: json["strCategoryDescription"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "idCategory": idCategory,
      "strCategory": strCategory,
      "strCategoryThumb": strCategoryThumb,
      "strCategoryDescription": strCategoryDescription,
    };
  }
}
