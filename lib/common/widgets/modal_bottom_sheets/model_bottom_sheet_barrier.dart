import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/sizes.dart';
import 'package:strava/utils/extensions/context_extensions.dart';

/// dùng để hiển thị model bottom
/// 
/// trường hợp sử dụng: dùng khi muốn hiển thị [barrier] (lớp phủ) kèm theo model bottom
class SModelBottomSheetBarrier {
  Future show({
    required BuildContext context,
    required Widget child,
    bool isDismissible = true,
    Color? barrierColor,
    bool isSnap = true,
    List<double> snapSizes = const [0.6, 0.8, 1],
    double initialChildSize = 0.5,
    double minChildSize = 0.2
  }) {
    final isDarkMode = context.isDarkMode();

    return showMaterialModalBottomSheet(
      useRootNavigator: true,
      // isDismissible: isDismissible,
      expand: false,
      context: context,
      barrierColor: barrierColor ?? (isDarkMode ? Colors.white.withOpacity(0.1) : Colors.black.withOpacity(0.2)),
      
      /// [DraggableScrollableSheet] có thể kéo thả điều chỉnh chiều cao chỉ khi bên trong nó có widget được kế thừa từ scrollController
      builder: (context) => DraggableScrollableSheet(
        /// cho snapSizes được hoạt động
        snap: isSnap,

        /// danh sách các nấc thang mà người dùng có thể kéo
        snapSizes: snapSizes,

        
        /// 50% height screen khi bật lên
        initialChildSize: initialChildSize,

        minChildSize: minChildSize,
        maxChildSize: snapSizes.last,

        /// chỉ chiếm phần diện tích của [DraggableScrollableSheet] chứ không chiếm luôn diện tích của [showMaterialModalBottomSheet]
        ///
        /// expand = true => phần [barrierColor] của [showMaterialModalBottomSheet] sẽ không hiển thị
        expand: false,

        builder: (context, scrollController) => Column(
          children: [
            /// --Indicator
            ///
            /// Việc dùng listview để dùng controllor
            ListView(
              /// Commen giải thích::::
              ///
              /// nghĩa là dùng scrollControler ở đây để khi scroll "child widget" sẽ điều khiển luôn cả widget "bottom sheet"
              /// vì đang sử dụng scrollController cấp cao nhất
              controller: scrollController,
              shrinkWrap: true,
              children: [
                Center(
                  child: Container(
                    width: 40,
                    height: 6,
                    margin: const EdgeInsets.only(
                      top: 4,
                      bottom: SSizes.defaultSpace,
                    ),
                    decoration: BoxDecoration(
                      color: SAppColors.dark.grayDark,
                      borderRadius: BorderRadius.circular(9),
                    ),
                  ),
                ),
              ],
            ),

            /// --child
            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (_) {
                  // khi widget này scroll sẽ không thông báo tới "parent widget"
                  return true;
                },
                child: SingleChildScrollView(
                  /// Commen giải thích::::
                  ///
                  /// nghĩa là không dùng scrollControler ở đây để khi scroll "child widget" sẽ không điều khiển luôn cả widget "bottom sheet"
                  /// vì đang sử dụng scrollController cấp cao nhất
                  ///
                  // controller: scrollController,
                  physics:
                      AlwaysScrollableScrollPhysics(), // cho phép "child widget" scroll
                  padding: EdgeInsets.only(
                    left: SSizes.md,
                    right: SSizes.md,
                    bottom: SSizes.md
                  ),
                  child: child
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
