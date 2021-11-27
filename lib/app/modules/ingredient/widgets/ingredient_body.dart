import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/modules/ingredient/widgets/ingredient_shape.dart';

class IngredientBody extends StatelessWidget {
  final List<Ingredient> myList;
  const IngredientBody({Key? key, required this.myList}) : super(key: key);

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
        final Ingredient ingredient = myList[i];
        return IngredientShape(ingredient: ingredient);
      },
    );
  }
}
