import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/ingredients.dart';

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

class IngredientShape extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientShape({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppTheme.mainColor.withOpacity(.5),
            width: 1,
          ),
        ),
        child: Column(
          children: [
            /*
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ImageNetwork(
                  image: "${ingredient.}",
                ),
              ),
            ),
            */
            Padding(
              padding: const EdgeInsets.all(5),
              child: Text(
                "${ingredient.strIngredient}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
