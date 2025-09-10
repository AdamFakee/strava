// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:strava/utils/popups/snackbar.dart';

/// xử lý `try-catch` để hiển thị thông báo khi `controller` bắt được lỗi 
Future<T?> SHandleControllerExeption<T> (BuildContext context, Future<T> Function() action) async {
  try {
    return await action();
  } catch (e) {
    if(context.mounted) {
      SSnackbar.show(context, type: SSnackbarEnum.error, message: e.toString());
    }
    return null;
  }
}