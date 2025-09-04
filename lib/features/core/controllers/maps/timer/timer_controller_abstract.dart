class STimerControllerStateType {
  int time;
  
  STimerControllerStateType.init(): time = 0;

  STimerControllerStateType({
    required this.time,
  });

  STimerControllerStateType copyWith({
    int? time
  }) {
    return STimerControllerStateType(time: time ?? this.time);
  }
}

/// interface
/// Dùng để quản lý bộ đếm thời gian trong session chạy bộ
abstract class STimerControllerAbstract {
  /// Bắt đầu đếm giờ (mỗi giây tăng lên 1)
  void start();

  /// Dừng đếm giờ và reset thời gian về 0
  void stop();
}
