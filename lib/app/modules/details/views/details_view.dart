import 'package:flutter/material.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/details/controllers/details_controller.dart';
import 'package:food_app/app/modules/details/widgets/details_body.dart';
import 'package:food_app/app/shared/back_icon.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:get/get.dart';

class DetailsView extends StatefulWidget {
  final Meal? meal;
  const DetailsView({Key? key, this.meal}) : super(key: key);
  @override
  State<DetailsView> createState() => _DetailsViewState();
}

class _DetailsViewState extends State<DetailsView> {
  final DetailsController controller = Get.put(DetailsController());
  late AppResponse appResponse = AppResponse();

  lookupMeal(String id) async {
    appResponse = await controller.loadLookupMeal(id);
  }

  @override
  void initState() {
    super.initState();
    lookupMeal("${widget.meal!.idMeal}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text("${widget.meal!.strMeal}"),
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          if (appResponse.success) {
            final Meals meals = appResponse.response;
            final List<Meal> myList = meals.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              final Meal meal = myList.first;
              return DetailsBody(meal: meal);
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
