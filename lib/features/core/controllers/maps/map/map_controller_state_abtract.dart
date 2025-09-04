import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class SMapControllerStateType {
  final Set<Polyline> polylines;
  final LocationData? locationData;
  final String mapStyle;
  final Completer<GoogleMapController> controller;
  final List<LatLng> routePoints;

  SMapControllerStateType({
    required this.polylines,
    required this.locationData,
    required this.mapStyle,
    required this.controller,
    required this.routePoints
  });

  SMapControllerStateType copyWith({
    Set<Polyline>? polylines, 
    LocationData? locationData,
    String? mapStyle,
    Completer<GoogleMapController>? controller,
    List<LatLng>? routePoints
  }) {
    return SMapControllerStateType(
      polylines: polylines ?? this.polylines,
      locationData: locationData ?? this.locationData,
      mapStyle: mapStyle ?? this.mapStyle,
      controller: controller ?? this.controller,
      routePoints: routePoints ?? this.routePoints
    );
  }
}

/// Interface cho các controller quản lý Google Map + route khi chạy bộ
abstract class SMapControllerStateAbtract {
  /// Khởi tạo map (lấy vị trí hiện tại, di chuyển camera tới đó)
  Future<void> init();

  /// Bắt đầu lắng nghe vị trí GPS
  void start();

  /// Dừng lắng nghe vị trí GPS
  void stop();

  /// Di chuyển camera tới một vị trí mới 
  Future<void> moveToLocation(LocationData locationData, {double zoom = 17});

  /// Chuyển đổi từ LocationData sang LatLng
  LatLng fromLocationDataToLatLng(LocationData locationData);

  /// Tạo polyline mới từ danh sách các điểm LatLng
  Polyline createPolyline(List<LatLng> points);

  /// Cập nhật state polyline + routePoints khi có vị trí GPS mới
  void updatePolylines(LocationData locationData);
}
