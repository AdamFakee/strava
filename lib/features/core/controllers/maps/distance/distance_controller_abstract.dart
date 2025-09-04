class SDistanceControllerStateType {
  double distance;

  SDistanceControllerStateType.init(): distance = 0;

  SDistanceControllerStateType({
    required this.distance,
  });

  SDistanceControllerStateType copyWith({
    double? distance
  }) {
    return SDistanceControllerStateType(
      distance: distance ?? this.distance
    );
  }
}

abstract class SDistanceControllerAbstract {
  /// bắt đầu tính khoảng cách di chuyển
  void start ();

  /// dừng và reset distance
  void stop ();
}
