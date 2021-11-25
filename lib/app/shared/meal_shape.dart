import 'package:flutter/material.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/shared/image_network.dart';

class MealShape extends StatelessWidget {
  final Meal meal;
  const MealShape({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.primaryBackColor.withOpacity(.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryBackColor,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [AppConstant.boxShadow],
              ),
              child: ImageNetwork(
                image: "${meal.strMealThumb}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (meal.strArea != null)
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              minVerticalPadding: 0,
              title: Text(
                "${meal.strMeal}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.75),
                  fontWeight: FontWeight.w900,
                ),
              ),
              subtitle: Text(
                "${meal.strArea}",
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: AppTheme.primaryTextColor.withOpacity(.64),
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          else
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 5),
              minVerticalPadding: 0,
              title: Text(
                "${meal.strMeal}",
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
    );
  }
}
