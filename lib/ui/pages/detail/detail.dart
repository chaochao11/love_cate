import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:love_cate/core/model/meal_model.dart';
import 'package:love_cate/core/view_model/favor_view_model.dart';
import 'package:love_cate/ui/pages/detail/detail_content.dart';

class YSDetailPage extends StatelessWidget {
  static const String routeName = '/detail';

  @override
  Widget build(BuildContext context) {
    final _meal = ModalRoute.of(context).settings.arguments as YSMealModel;
    return Scaffold(
      appBar: AppBar(
        title: Text(_meal.title),
      ),
      body: YSDetailContent(_meal),
      floatingActionButton: Consumer<YSFavorViewModel>(
        builder: (ctx, favorVM, child) {
          // 判断收藏状态
          final iconData = favorVM.isFavor(_meal) ? Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;

          return FloatingActionButton(
            child: Icon(iconData, color: iconColor,),
            onPressed: () {
              favorVM.handleMeal(_meal);
            }
          );
        },
      ),
    );
  }
}
