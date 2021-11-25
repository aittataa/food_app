import 'package:flutter/material.dart';
import 'package:food_app/app/config/messages/app_message.dart';
import 'package:get/get.dart';

import '../controllers/ingredient_controller.dart';

class IngredientView extends GetView<IngredientController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppMessage.labelIngredients)),
    );
  }
}
