import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/details/widgets/details_shape.dart';

import '../../../shared/image_network.dart';

class DetailsBody extends StatelessWidget {
  final Meal meal;
  const DetailsBody({Key? key, required this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: AppTheme.mainColor, width: 1),
          ),
          child: ImageNetwork(image: "${meal.strMealThumb}"),
        ),
        if (meal.strTags != null)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(meal.strTags!.split(",").length, (i) {
              final String tag = meal.strTags!.split(",")[i];
              final Color backColor = Color(AppFunction.getRandomColor);
              return Chip(
                backgroundColor: backColor.withOpacity(.66),
                avatar: CircleAvatar(
                  backgroundColor: backColor,
                  child: Text(
                    "${tag[0]}",
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: AppTheme.primaryTextColor,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                label: Text(
                  "$tag",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppTheme.primaryTextColor,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1,
                  ),
                ),
              );
            }),
          ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Text(
            "Ingredients",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppTheme.primaryTextColor,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
        GridView(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          gridDelegate: AppFunction.gridDelegate(
            crossAxisCount: 3,
            childAspectRatio: 1.75,
            spacing: 5,
          ),
          children: [
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient1}",
                strIngredient: "${meal.strMeasure1} ${meal.strIngredient1}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient2}",
                strIngredient: "${meal.strMeasure2} ${meal.strIngredient2}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient3}",
                strIngredient: "${meal.strMeasure3} ${meal.strIngredient3}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient4}",
                strIngredient: "${meal.strMeasure4} ${meal.strIngredient4}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient5}",
                strIngredient: "${meal.strMeasure5} ${meal.strIngredient5}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient6}",
                strIngredient: "${meal.strMeasure6} ${meal.strIngredient6}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient7}",
                strIngredient: "${meal.strMeasure7} ${meal.strIngredient7}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient8}",
                strIngredient: "${meal.strMeasure8} ${meal.strIngredient8}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient9}",
                strIngredient: "${meal.strMeasure9} ${meal.strIngredient9}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient10}",
                strIngredient: "${meal.strMeasure10} ${meal.strIngredient10}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient11}",
                strIngredient: "${meal.strMeasure11} ${meal.strIngredient11}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient12}",
                strIngredient: "${meal.strMeasure12} ${meal.strIngredient12}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient13}",
                strIngredient: "${meal.strMeasure13} ${meal.strIngredient13}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient14}",
                strIngredient: "${meal.strMeasure14} ${meal.strIngredient14}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient15}",
                strIngredient: "${meal.strMeasure15} ${meal.strIngredient15}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient16}",
                strIngredient: "${meal.strMeasure16} ${meal.strIngredient16}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient17}",
                strIngredient: "${meal.strMeasure17} ${meal.strIngredient17}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient18}",
                strIngredient: "${meal.strMeasure18} ${meal.strIngredient18}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient19}",
                strIngredient: "${meal.strMeasure19} ${meal.strIngredient19}",
              ),
            ),
            DetailsShape(
              ingredient: Ingredient(
                strIngredientThumb: "${meal.strThumbIngredient20}",
                strIngredient: "${meal.strMeasure20} ${meal.strIngredient20}",
              ),
            ),
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          minVerticalPadding: 0,
          title: Text(
            "Instructions",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppTheme.primaryTextColor,
              fontWeight: FontWeight.w900,
              fontSize: 18,
              letterSpacing: 1,
            ),
          ),
        ),
        ListTile(
          contentPadding: EdgeInsets.all(5),
          minVerticalPadding: 0,
          title: Text(
            "${meal.strInstructions}",
            style: TextStyle(
              color: AppTheme.primaryTextColor.withOpacity(.75),
              fontWeight: FontWeight.w900,
              fontSize: 17,
              letterSpacing: 1,
            ),
          ),
        ),
      ],
    );
  }
}
