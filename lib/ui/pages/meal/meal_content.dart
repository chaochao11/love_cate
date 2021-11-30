import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:love_cate/core/model/category_model.dart';
import 'package:love_cate/core/model/meal_model.dart';
import 'package:love_cate/core/view_model/meal_view_model.dart';
import 'package:love_cate/ui/widgets/meal_item.dart';

class YSMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context).settings.arguments as YSCategoryModel;
    return Selector<YSMealViewModel, List<YSMealModel>>(
      selector: (ctx, mealVM) {
        return mealVM.meals.where((meal) {
          return meal.categories.contains(category.id);
        }).toList();
      },
      shouldRebuild: (prev, next) => !ListEquality().equals(prev, next),
      builder: (ctx, meals, child) {
        return ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) {
            return YSMealItem(meals[index]);
          },
        );
      },
    );
  }
}

//class GLMealContent extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    final category = ModalRoute.of(context).settings.arguments as GLCategoryModel;
//    return Consumer<GLMealViewModel>(
//      builder: (ctx, mealVM, child) {
//        final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
//        return ListView.builder(
//            itemCount: meals.length,
//            itemBuilder: (ctx, index) {
//              return ListTile(title: Text(meals[index].title),);
//            }
//        );
//      },
//    );
//  }
//}
