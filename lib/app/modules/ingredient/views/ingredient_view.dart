import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/meal_shape.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:food_app/app/shared/title_shape.dart';
import 'package:get/get.dart';

import '../controllers/ingredient_controller.dart';

class IngredientView extends StatefulWidget {
  @override
  State<IngredientView> createState() => _IngredientViewState();
}

class _IngredientViewState extends State<IngredientView> {
  final IngredientController controller = Get.put(IngredientController());
  late AppResponse appResponse = AppResponse();
  late int myIndex;
  late String label;
  filterMeals(String value) async {
    appResponse = await controller.loadFilterMeals("i=$value");
  }

  @override
  void initState() {
    super.initState();
    myIndex = 0;
    label = "Chicken";
    filterMeals(label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.labelIngredients)),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          AppResponse response = controller.appResponse.value;
          if (response.success) {
            final Ingredients ingredients = controller.ingredients.value;
            final List<Ingredient> myList = ingredients.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      padding: EdgeInsets.all(5),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: myList.length,
                      itemBuilder: (context, i) {
                        final Ingredient ingredient = myList[i];
                        final bool state = myIndex == i;
                        return TitleShape(
                          label: ingredient.strIngredient!,
                          state: state,
                          onTap: () {
                            setState(() {
                              myIndex = i;
                              label = ingredient.strIngredient!;
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
    );
  }
}
