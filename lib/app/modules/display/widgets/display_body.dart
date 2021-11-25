import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/shared/meal_shape.dart';

class DisplayBody extends StatelessWidget {
  final List<Meal> myList;
  const DisplayBody({Key? key, required this.myList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.all(10),
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      gridDelegate: AppFunction.gridDelegate(
        crossAxisCount: 2,
        childAspectRatio: .64,
      ),
      itemCount: myList.length,
      itemBuilder: (context, i) {
        final Meal meal = myList[i];
        return MealShape(meal: meal);
      },
    );
  }
}
