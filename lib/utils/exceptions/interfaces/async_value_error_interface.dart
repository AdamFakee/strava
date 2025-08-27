import 'package:strava/utils/popups/snackbar.dart';


/// đoạn này tính làm interface để trả về cảnh báo tuỳ theo mức độ cho người dùng
/// nhưng mà phải sửa lại nên thôi, dùng string luôn cho khoẻ

/// interface for [AsyncError] in [AsyncNotifier]
class SAsyncValueErrorInterface {
  final String message;
  final SSnackbarEnum type;

  SAsyncValueErrorInterface({
    required this.message, 
    required this.type
  });
}
