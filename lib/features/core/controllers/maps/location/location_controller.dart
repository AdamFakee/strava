import 'dart:async';
import 'package:location/location.dart';
import 'package:strava/features/core/controllers/maps/location/location_controller_abstract.dart';

class SLocationController implements SLocationControllerAbstract {
  final _location = Location();

  @override
  Location get location => _location;

  @override
  Future<bool> checkServiceEnabled () async {
    bool serviceEnabled = await _location.serviceEnabled();
    if(serviceEnabled == false) {
      serviceEnabled = await _location.requestService();
      if(serviceEnabled == false) {
        return false;
      }
    }

    return true;
  }

  @override
  Future<PermissionStatus> checkPermision() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if(permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      if(permissionStatus != PermissionStatus.granted) {
        return permissionStatus;
      }
    }
    
    return PermissionStatus.granted;
  }

  @override
  Future<LocationData> getCurrentLocation () async {
    final serviceEnalbled = await checkServiceEnabled();
    if(serviceEnalbled == false) throw('Cần phải kích hoạt service để có thể cập nhật được vị trí của bạn');

    final permissionStatus = await checkPermision();
    if(permissionStatus != PermissionStatus.granted) throw('Để sử dụng thì cần phải cấp quyền truy cập vị trí cho ứng dụng');

    return _location.getLocation();
  }
}