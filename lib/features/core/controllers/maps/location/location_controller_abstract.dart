import 'package:location/location.dart';

abstract class SLocationControllerAbstract {
  Location get location;

  Future<bool> checkServiceEnabled();

  Future<PermissionStatus> checkPermision();

  Future<LocationData> getCurrentLocation();
}
