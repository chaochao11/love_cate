import 'base_view_model.dart';
import '../services/meal_request.dart';

class YSMealViewModel extends YSBaseMealViewModel {
  YSMealViewModel(){
    GLMealRequest.getMealData().then((res) {
      meals = res;
    });
  }
}