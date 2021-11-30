import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:love_cate/core/router/router.dart';
import 'package:love_cate/ui/shared/app_theme.dart';
import 'package:love_cate/ui/shared/size_fit.dart';
import 'package:love_cate/core/view_model/favor_view_model.dart';
import 'package:love_cate/core/view_model/filter_view_model.dart';
import 'package:love_cate/core/view_model/meal_view_model.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => YSFilterViewModel()),
        ChangeNotifierProxyProvider<YSFilterViewModel, YSMealViewModel>(
            create: (ctx) => YSMealViewModel(),
            update: (ctx, filterVM, mealVM) {
              mealVM.updateFilters(filterVM);
              return mealVM;
            }
        ),
        ChangeNotifierProxyProvider<YSFilterViewModel, YSFavorViewModel>(
            create: (ctx) => YSFavorViewModel(),
            update: (ctx, filterVM, favorVM) {
              favorVM.updateFilters(filterVM);
              return favorVM;
            }
        ),
      ],
      child: MyApp(),
    )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // 获取屏幕大小
    YSSizeFit.initialize();

    return MaterialApp(
      title: '爱美食',
      theme: YSAppTheme.norTheme,
      routes: YSRouter.routes,
      initialRoute: YSRouter.initialRoute,
      onGenerateRoute: YSRouter.generateRoute,
      onUnknownRoute: YSRouter.unknownRoute,
    );
  }
}
