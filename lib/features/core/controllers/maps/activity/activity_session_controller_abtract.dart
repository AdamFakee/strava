import 'package:flutter/cupertino.dart';

class SActivitySessionControllerStateType {
  bool start;

  SActivitySessionControllerStateType({
    required this.start,
  });

  SActivitySessionControllerStateType.init(): start = false;

  SActivitySessionControllerStateType copyWith({
    bool? start
  }) {
    return SActivitySessionControllerStateType(start: start ?? this.start);
  }
}


abstract class ActivitySessionControllerAbtract {
  /// toggle stop hoặc start tuỳ vào `state` thuộc `SActivitySessionControllerStateType`
  void toggleActivity(BuildContext context);
}