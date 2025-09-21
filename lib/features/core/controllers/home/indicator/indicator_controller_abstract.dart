// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class SIndicatorControllerAbstract {
  /// idx: index trang tiếp theo
  /// 
  /// pages: number of pages 
  void move(int idx, int numOfPages);
}

class SIndicatorControllerStateType {
  int currentIdxPage;

  SIndicatorControllerStateType({
    required this.currentIdxPage,
  });

  factory SIndicatorControllerStateType.init() => SIndicatorControllerStateType(currentIdxPage: 1);
  

  SIndicatorControllerStateType copyWith({
    int? currentIdxPage,
  }) {
    return SIndicatorControllerStateType(
      currentIdxPage: currentIdxPage ?? this.currentIdxPage,
    );
  }
}
