import 'package:flutter/material.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/modules/display/views/display_view.dart';
import 'package:food_app/app/routes/app_pages.dart';
import 'package:food_app/app/shared/image_network.dart';
import 'package:get/get.dart';

class CategoryShape extends StatelessWidget {
  final Category category;
  const CategoryShape({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(() => DisplayView(title: category.strCategory, page: Routes.CATEGORIES)),
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.primaryBackColor.withOpacity(.5),
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: AppTheme.mainColor.withOpacity(.5),
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
                child: ImageNetwork(
                  image: "${category.strCategoryThumb}",
                ),
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
      ),
    );
  }
}
