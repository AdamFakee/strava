class SFormatHelpers {

  /// Converts a number of seconds into a time string: `hh:mm:ss`.
  ///
  /// Examples:
  /// - `59`   → `00:59`
  /// - `9`    → `00:09`
  /// - `131`  → `02:11`
  ///
  /// Notes:
  /// - The `hh` (hours) part is not capped at 24.
  ///   This method does **not** handle days.
  static String secondToTimeClock(int seconds) {
    if(seconds == 0) return "00:00";

    String result = '';
    while (seconds > 0) {
      int value = seconds % 60;
      String valueString = value < 10 ? '0$value' : value.toString();
      if(result.isEmpty) {
        result = valueString;
      } else {
        result = '$valueString:$result';
      }
      seconds = seconds ~/ 60;
    }
    return result.length > 2 ? result : '00:$result';
  }
}