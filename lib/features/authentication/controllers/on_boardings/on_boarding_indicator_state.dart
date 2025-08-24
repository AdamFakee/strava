import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:strava/utils/const/global.dart';

class SOnBoardingIndicatorState extends Notifier<int> {
  @override
  int build() {
    return 0;
  }

  // khởi tạo page cao để tạo vô cực từ 2 phía
  // thay vì để mặc định [initialPage] = 0 => chỉ vô cực phía bên phải
  final PageController controller = PageController(
    initialPage: SGlobals.numOfPageViews * 1000
  );

  void changeIdxInPageView (int pageIdx) {
    state = pageIdx % SGlobals.numOfPageViews;
  }
}