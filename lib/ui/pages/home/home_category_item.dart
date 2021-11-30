import 'package:love_cate/core/model/category_model.dart';
import 'package:love_cate/core/extension/num_extension.dart';
import 'package:love_cate/ui/pages/meal/meal.dart';

import 'package:flutter/material.dart';

class YSHomeCategoryItem extends StatelessWidget {
  final YSCategoryModel _category;
  YSHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.finalColor;
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(12.px),
            gradient: LinearGradient(colors: [bgColor.withOpacity(.5), bgColor])
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.display2.copyWith(
              fontWeight: FontWeight.bold
          ),
        ),
      ),
      onTap: () {
        Navigator.of(context).pushNamed(YSMealPage.routeName, arguments: _category);
      },
    );
  }
}