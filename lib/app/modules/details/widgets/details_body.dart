import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/shared/image_network.dart';

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
        ImageNetwork(image: "${meal.strMealThumb}"),
        if (meal.strTags != null)
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: List.generate(meal.strTags!.split(",").length, (i) {
              final String tag = meal.strTags!.split(",")[i];
              final Color backColor = Color(AppFunction.getRandomColor);
              return Chip(
                backgroundColor: backColor.withOpacity(.5),
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
          title: Text(
            "Ingredients",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: AppTheme.primaryTextColor,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),
        )
      ],
    );
  }
}
