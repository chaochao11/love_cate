import 'package:flutter/material.dart';
import 'package:love_cate/core/model/category_model.dart';
import 'meal_content.dart';

class YSMealPage extends StatelessWidget {
  static const String routeName = '/meal';

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as YSCategoryModel;

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: YSMealContent(),
    );
  }
}
