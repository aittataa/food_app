import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/home/controllers/home_controller.dart';
import 'package:food_app/app/modules/home/widgets/home_body.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());

  late AppResponse appResponse = AppResponse();
  late String label = "American";
  filterMeals(String value) async {
    final AppResponse response = await controller.loadFilterMeals("a=$label");
    setState(() => {appResponse = response});
  }

  @override
  void initState() {
    super.initState();
    filterMeals(label);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.appTitle)),
      body: Obx(() {
        final bool state = controller.state.value;
        if (!state) {
          final AppResponse response = controller.appResponse.value;
          if (response.success) {
            final Meals meals = controller.areasTitle.value;
            final List<Meal> titles = meals.myList ?? [];
            final bool isNotEmpty = titles.isNotEmpty;
            if (isNotEmpty) {
              return Column(
                children: [
                  SizedBox(
                    height: 50,
                    child: PageView.builder(
                      padEnds: false,
                      controller: PageController(viewportFraction: .3),
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: titles.length,
                      itemBuilder: (context, i) {
                        final Meal meal = titles[i];
                        return TitleShape(
                          label: meal.strArea!,
                          onTap: () async {
                            setState(() => {label = meal.strArea!});
                            filterMeals(label);
                          },
                        );
                      },
                    ),
                  ),
                  Expanded(child: Obx(() {
                    final bool state = controller.loadState.value;
                    if (!state) {
                      if (response.success) {
                        final Meals meals = appResponse.response;
                        final List<Meal> myList = meals.myList ?? [];
                        final bool isNotEmpty = myList.isNotEmpty;
                        if (isNotEmpty) {
                          return Expanded(child: Center(child: Text("${myList.length}")));
                        } else {
                          return EmptyBox();
                        }
                      } else {
                        return ResponseError(response: appResponse);
                      }
                    } else {
                      return BouncePoint();
                    }
                  })),
                ],
              );

              // return HomeBody(
              //   controller: controller,
              //   titles: titles..sort((a, b) => a.strArea!.compareTo(b.strArea!)),
              // );
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
