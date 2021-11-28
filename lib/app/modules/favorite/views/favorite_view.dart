import 'package:flutter/material.dart';
import 'package:food_app/app/config/functions/app_function.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/favorite/controllers/favorite_controller.dart';
import 'package:food_app/app/shared/back_icon.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/meal_shape.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:get/get.dart';

class FavoriteView extends StatefulWidget {
  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  final FavoriteController controller = Get.put(FavoriteController());

  late AppResponse appResponse = AppResponse();
  searchMeals(String value) async {
    appResponse = await controller.loadSearchMeals(value);
  }

  @override
  void initState() {
    super.initState();
    searchMeals("a");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackIcon(),
        title: Text("WishList"),
      ),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          if (appResponse.success) {
            final Meals meals = appResponse.response;
            final List<Meal> myList = meals.myList ?? [];
            final bool isNotEmpty = myList.isNotEmpty;
            if (isNotEmpty) {
              return FavoriteBody(myList: myList);
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

class FavoriteBody extends StatelessWidget {
  final List<Meal> myList;
  const FavoriteBody({Key? key, required this.myList}) : super(key: key);

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
