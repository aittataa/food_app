import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/modules/display/views/display_view.dart';
import 'package:food_app/app/routes/app_pages.dart';
import 'package:food_app/app/shared/image_network.dart';
import 'package:get/get.dart';

class IngredientShape extends StatelessWidget {
  final Ingredient ingredient;
  const IngredientShape({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DisplayView(title: ingredient.strIngredient, page: Routes.INGREDIENT)),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryBackColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: ImageNetwork(
                  image: "${ingredient.strIngredientThumb}",
                ),
              ),
            ),
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
