import 'package:flutter/material.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/display/controllers/display_controller.dart';
import 'package:food_app/app/modules/display/widgets/display_body.dart';
import 'package:food_app/app/shared/back_icon.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:get/get.dart';

class DisplayView extends StatefulWidget {
  final String? title;
  const DisplayView({Key? key, this.title}) : super(key: key);
  @override
  State<DisplayView> createState() => _DisplayViewState();
}

class _DisplayViewState extends State<DisplayView> {
  final DisplayController controller = Get.put(DisplayController());
  late AppResponse appResponse = AppResponse();
  late String title;

  filterMeals(String value) async {
    Future.delayed(Duration.zero, () async {
      appResponse = await controller.loadFilterMeals("c=$value");
    });
  }

  @override
  void initState() {
    super.initState();
    title = widget.title!;
    filterMeals(title);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text(title),
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          if (appResponse.success) {
            final Meals meals = appResponse.response;
            final List<Meal> myList = meals.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return DisplayBody(
                myList: myList..sort((a, b) => a.strMeal!.compareTo(b.strMeal!)),
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
