import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/categories.dart';
import 'package:food_app/app/modules/categories/controllers/categories_controller.dart';
import 'package:food_app/app/modules/categories/widgets/categories_body.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:get/get.dart';

class CategoriesView extends StatelessWidget {
  final CategoriesController controller = Get.put(CategoriesController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.labelCategories)),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          AppResponse appResponse = controller.appResponse.value;
          if (appResponse.success) {
            final Categories categories = controller.categories.value;
            final List<Category> myList = categories.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return CategoriesBody(
                myList: myList..sort((a, b) => a.strCategory!.compareTo(b.strCategory!)),
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
