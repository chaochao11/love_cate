import 'package:love_cate/ui/shared/size_fit.dart';

extension NumFit on num {
  double get px {
    return YSSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return YSSizeFit.setRpx(this.toDouble());
  }
}