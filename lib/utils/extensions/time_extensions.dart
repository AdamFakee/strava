extension TimeFormatting on int {
  /// Chuyển đổi giây thành chuỗi có định dạng "Xh Ym" hoặc "Ym"
  String toFormattedString() {
    final duration = Duration(seconds: this);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    final seconds = this - hours * 3600 - minutes * 60;

    if (hours > 0) {
      return "${hours}h ${minutes}m";
    } else if (minutes > 0) {
      return "${minutes}m ${seconds}s";
    } else {
      return "0m";
    }
  }
}