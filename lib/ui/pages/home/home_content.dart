import 'package:love_cate/core/extension/num_extension.dart';
import 'package:love_cate/core/model/category_model.dart';
import 'package:love_cate/core/services/json_parse.dart';
import 'package:love_cate/ui/pages/home/home_category_item.dart';

import 'package:flutter/material.dart';

class YSHomeContent extends StatefulWidget {
  @override
  _YSHomeContentState createState() => _YSHomeContentState();
}

class _YSHomeContentState extends State<YSHomeContent> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<YSCategoryModel>>(
      future: YSJsonParse.getCategoryData(),
      builder: (ctx, snapshot) {
        if(snapshot.hasError) return Center(child: Text('请求失败'),);
        if(!snapshot.hasData) return Center(child: CircularProgressIndicator(),);

        final categories = snapshot.data;
        return GridView.builder(
            padding: EdgeInsets.all(20.px),
            itemCount: categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 20.px,
              mainAxisSpacing: 20.px,
              childAspectRatio: 1.5,
            ),
            itemBuilder: (ctx, index) {
              return YSHomeCategoryItem(categories[index]);
            }
        );
      },
    );
  }
}
