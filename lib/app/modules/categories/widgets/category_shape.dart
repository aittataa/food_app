import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/shared/image_network.dart';

class CategoryShape extends StatelessWidget {
  final Category category;

  const CategoryShape({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(
          color: AppTheme.mainColor.withOpacity(.25),
          width: 1.5,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: AppTheme.primaryBackColor,
                borderRadius: BorderRadius.circular(25),
              ),
              child: ImageNetwork(image: "${category.strCategoryThumb}"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              "${category.strCategory}",
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
