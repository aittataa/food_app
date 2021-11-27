import 'package:flutter/material.dart';import 'package:food_app/app/config/messages/app_message.dart';import 'package:food_app/app/config/responses/app_response.dart';import 'package:food_app/app/data/models/meals.dart';import 'package:food_app/app/modules/home/controllers/home_controller.dart';import 'package:food_app/app/modules/home/widgets/home_body.dart';import 'package:food_app/app/shared/bounce_point.dart';import 'package:food_app/app/shared/empty_box.dart';import 'package:food_app/app/shared/response_error.dart';import 'package:get/get.dart';class HomeView extends StatelessWidget {  final HomeController controller = Get.put(HomeController());  @override  Widget build(BuildContext context) {    return Scaffold(      appBar: AppBar(title: Text(AppMessage.appTitle)),      body: Obx(() {        final bool state = controller.state.value;        if (!state) {          final AppResponse appResponse = controller.appResponse.value;          if (appResponse.success) {            final Meals meals = controller.areasTitle.value;            final List<Meal> myList = meals.myList ?? [];            final bool isNotEmpty = myList.isNotEmpty;            if (isNotEmpty) {              return HomeBody(                controller: controller,                myList: myList..sort((a, b) => a.strArea!.compareTo(b.strArea!)),              );            } else {              return EmptyBox();            }          } else {            return ResponseError(response: appResponse);          }        } else {          return BouncePoint();        }      }),    );  }}