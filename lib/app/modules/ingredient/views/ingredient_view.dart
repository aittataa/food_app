import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/ingredients.dart';
import 'package:food_app/app/modules/ingredient/widgets/ingredient_body.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
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
              return IngredientBody(
                myList: myList..sort((a, b) => a.strIngredient!.compareTo(b.strIngredient!)),
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
