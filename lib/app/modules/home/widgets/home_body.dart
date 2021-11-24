import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/themes/app_theme.dart';
import 'package:food_app/app/data/models/categories.dart';

class HomeBody extends StatelessWidget {
  final List<Category> titles;

  const HomeBody({
    Key? key,
    required this.titles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 5),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: titles.length,
            itemBuilder: (context, i) {
              final Category category = titles[i];
              return TitleShape(category: category);
            },
          ),
        ),
      ],
    );
  }
}

class TitleShape extends StatelessWidget {
  final Category category;
  const TitleShape({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppTheme.mainColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Text(
        "${category.strCategory}",
        textAlign: TextAlign.center,
        style: TextStyle(
          color: AppTheme.primaryTextColor,
          fontWeight: FontWeight.w900,
          letterSpacing: 1,
        ),
      ),
    );
  }
}
