import 'package:love_cate/core/view_model/favor_view_model.dart';
import 'package:love_cate/ui/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class YSFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<YSFavorViewModel>(
      builder: (ctx, favorVM, child) {
        if(favorVM.meals.length == 0){
          return Center(
            child: Text('暂无收藏', style: Theme.of(ctx).textTheme.headline2,),
          );
        }
        return ListView.builder(
          itemCount: favorVM.meals.length,
          itemBuilder: (ctx, index) {
            return YSMealItem(favorVM.meals[index]);
          }
        );
      }
    );
  }
}
