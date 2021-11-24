import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/modules/categories/widgets/category_shape.dart';

class CategoriesBody extends StatelessWidget {
  final List<Category> myList;
  const CategoriesBody({
    Key? key,
    required this.myList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      gridDelegate: AppFunction.gridDelegate(
        crossAxisCount: 3,
        childAspectRatio: .75,
      ),
      itemCount: myList.length,
      itemBuilder: (context, i) {
        final Category category = myList[i];
        return CategoryShape(category: category);
      },
    );
  }
}
