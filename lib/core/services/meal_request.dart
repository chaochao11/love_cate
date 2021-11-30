import '../model/meal_model.dart';

import 'http_request.dart';

class GLMealRequest {
  static Future<List<YSMealModel>> getMealData() async {
    const url = '/meal';
    final res = await HttpRequest.request(url);

    final mealArr = res['meal'];
    List<YSMealModel> meals = [];
    for(var json in mealArr) {
      meals.add(YSMealModel.fromJson(json));
    }

    return meals;
  }
}