import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/home/controllers/home_controller.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/meal_shape.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:food_app/app/shared/title_shape.dart';
import 'package:get/get.dart';

class HomeBody extends StatefulWidget {
  final HomeController controller;
  final List<Meal> myList;
  const HomeBody({Key? key, required this.controller, required this.myList}) : super(key: key);
  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  late HomeController controller;
  late List<Meal> myList;
  late AppResponse appResponse = AppResponse();
  late int myIndex = 0;
  late String label;

  filterMeals(String value) async {
    appResponse = await controller.loadFilterMeals("a=$value");
  }

  @override
  void initState() {
    super.initState();
    controller = widget.controller;
    myList = widget.myList;
    filterMeals(myList.first.strArea!);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: ListView.builder(
            padding: EdgeInsets.all(5),
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, i) {
              final Meal meal = myList[i];
              final bool state = myIndex == i;
              return TitleShape(
                label: meal.strArea!,
                state: state,
                onTap: () async {
                  setState(() {
                    myIndex = i;
                    label = meal.strArea!;
                  });
                  filterMeals(label);
                },
              );
            },
          ),
        ),
        Expanded(
          child: Obx(() {
            final bool state = controller.loadState.value;
            if (!state) {
              if (appResponse.success) {
                final Meals meals = appResponse.response;
                final List<Meal> myList = meals.myList ?? [];
                final bool isNotEmpty = myList.isNotEmpty;
                if (isNotEmpty) {
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
                } else {
                  return EmptyBox();
                }
              } else {
                return ResponseError(response: appResponse);
              }
            } else {
              return BouncePoint();
            }
          }),
        ),
      ],
    );
  }
}
