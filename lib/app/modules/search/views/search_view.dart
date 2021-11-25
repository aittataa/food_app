import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:food_app/app/config/responses/app_response.dart';
import 'package:food_app/app/data/models/meals.dart';
import 'package:food_app/app/modules/search/controllers/search_controller.dart';
import 'package:food_app/app/modules/search/widgets/search_body.dart';
import 'package:food_app/app/shared/bounce_point.dart';
import 'package:food_app/app/shared/empty_box.dart';
import 'package:food_app/app/shared/response_error.dart';
import 'package:food_app/app/shared/search_bar.dart';
import 'package:get/get.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final SearchController controller = Get.put(SearchController());

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
      appBar: AppBar(title: Text(AppMessage.labelSearch)),
      body: Column(
        children: [
          SearchBar(
            onChanged: (value) async {
              searchMeals(value);
            },
          ),
          Expanded(
            child: Obx(() {
              final bool state = controller.state.value;
              if (!state) {
                if (appResponse.success) {
                  final Meals meals = appResponse.response;
                  final List<Meal> myList = meals.myList ?? [];
                  final bool isNotEmpty = myList.isNotEmpty;
                  if (isNotEmpty) {
                    return SearchBody(myList: myList..sort((a, b) => b.idMeal!.compareTo(a.idMeal!)));
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
      ),
    );
  }
}
