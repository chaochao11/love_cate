import 'package:love_cate/core/model/meal_model.dart';
import 'base_view_model.dart';

class YSFavorViewModel extends YSBaseMealViewModel {

  void addMeal(YSMealModel meal) {
    originalMeals.add(meal);
    notifyListeners();
  }

  void removeMeal(YSMealModel meal) {
    originalMeals.remove(meal);
    notifyListeners();
  }

  void handleMeal(YSMealModel meal) {
    if(isFavor(meal)){
      removeMeal(meal);
    }else {
      addMeal(meal);
    }
  }

  bool isFavor(YSMealModel meal) {
    return originalMeals.contains(meal);
  }
}