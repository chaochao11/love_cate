import 'package:flutter/material.dart';
import 'package:love_cate/ui/pages/detail/detail.dart';
import 'package:love_cate/ui/pages/filter/filter.dart';
import 'package:love_cate/ui/pages/main/main.dart';
import 'package:love_cate/ui/pages/meal/meal.dart';

class YSRouter {
  static final initialRoute = YSMainPage.routeName;

  static final Map<String, WidgetBuilder> routes = {
    YSMainPage.routeName: (ctx) => YSMainPage(),
    YSMealPage.routeName: (ctx) => YSMealPage(),
    YSDetailPage.routeName: (ctx) => YSDetailPage(),
  };

  static final RouteFactory generateRoute = (settings) {
    // GLFilterPage需要从底部全屏弹出，所以放到这里管理
    if(settings.name == YSFilterPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return YSFilterPage();
          },
          fullscreenDialog: true  // 全屏弹出
      );
    }
    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };
}