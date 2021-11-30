import 'package:flutter/material.dart';

import '../model/meal_model.dart';
import 'filter_view_model.dart';

class YSBaseMealViewModel extends ChangeNotifier {
  List<YSMealModel> _meals = [];

  YSFilterViewModel _filterVM;

  void updateFilters(YSFilterViewModel filterVM) {
    _filterVM = filterVM;
    notifyListeners();
  }

  set meals(List<YSMealModel> value) {
    _meals = value;
    notifyListeners();
  }

  List<YSMealModel> get meals {
    return _meals.where((meal) {
      if(_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if(_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if(_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if(_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<YSMealModel> get originalMeals {
    return _meals;
  }
}