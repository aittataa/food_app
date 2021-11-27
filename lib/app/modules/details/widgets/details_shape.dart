import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/modules/display/views/display_view.dart';
import 'package:food_app/app/routes/app_pages.dart';
import 'package:food_app/app/shared/image_network.dart';
import 'package:get/get.dart';

class DetailsShape extends StatelessWidget {
  final Ingredient ingredient;
  const DetailsShape({Key? key, required this.ingredient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DisplayView(title: ingredient.strIngredient, page: Routes.INGREDIENT)),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryBackColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: AppTheme.mainColor, width: 1),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: AppTheme.primaryBackColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ImageNetwork(
                  image: "${ingredient.strIngredientThumb}",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
              child: Text(
                "${ingredient.strIngredient}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.primaryTextColor,
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
