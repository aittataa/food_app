import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/constants/app_constant.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/details/views/details_view.dart';
import 'package:food_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:food_app/app/shared/image_network.dart';
import 'package:get/get.dart';

class MealShape extends StatefulWidget {
  final Meal meal;
  MealShape({
    Key? key,
    required this.meal,
  }) : super(key: key);

  @override
  State<MealShape> createState() => _MealShapeState(meal);
}

class _MealShapeState extends State<MealShape> {
  final FavoriteController controller = Get.put(FavoriteController());
  final Meal meal;

  _MealShapeState(this.meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DetailsView(meal: meal)),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryBackColor,
          borderRadius: BorderRadius.circular(25),
          boxShadow: [AppConstant.boxShadow],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: AppTheme.primaryBackColor,
                      borderRadius: BorderRadius.circular(25),
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
            Align(
              alignment: Alignment.topRight,
              child: GestureDetector(
                onTap: () async {
                  setState(() => {meal.updateState});
                  final String id = meal.idMeal!;
                  final bool state = meal.state;
                  var data = await controller.setFavorite(id, state);
                  print(data);
                },
                child: Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(7.5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppTheme.secondaryBackColor.withOpacity(.75),
                  ),
                  child: Icon(
                    meal.state ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                    color: meal.state ? AppTheme.mainIconColor : AppTheme.secondaryIconColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
