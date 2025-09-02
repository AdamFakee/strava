import 'package:flutter/material.dart';

enum SIconType {
  iconData,
  svg,
  generalImage,
  unknown,
}

/// dùng để kiểm trả type của giá trị truyền vào là icon, image svg hay image khác
SIconType detectIconType(dynamic icon) {
  if (icon is IconData) {
    return SIconType.iconData;
  } else if (icon is String) {
    if (icon.endsWith('.svg')) {
      return SIconType.svg;
    } else {
      return SIconType.generalImage;
    }
  } else {
    return SIconType.unknown;
  }
}
