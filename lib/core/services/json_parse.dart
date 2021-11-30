import 'dart:convert';
import 'package:flutter/services.dart';

import '../model/category_model.dart';

class YSJsonParse {
  static Future<List<YSCategoryModel>> getCategoryData() async {
    // 1.rootBundle.loadStrin加载本地json文件，返回Future，异步的
    final jsonString = await rootBundle.loadString('assets/json/category.json');

    // 2.将jsonString转成Map/List
    final res = json.decode(jsonString);

    // 3.将Map内容转成对象
    final resList = res['category'];
    List<YSCategoryModel> categories = [];
    for(var json in resList) {
      categories.add(YSCategoryModel.fromJson(json));
    }

    return categories;
  }
}