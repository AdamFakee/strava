import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:strava/features/core/controllers/maps/location/location_controller.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_state_abtract.dart';
import 'package:strava/utils/const/colors.dart';
import 'package:strava/utils/const/google_map_styles_string.dart';

class SMapControllerState extends Notifier<SMapControllerStateType> implements SMapControllerStateAbtract{
  @override
  SMapControllerStateType build() {
    return SMapControllerStateType(
      polylines: {},
      locationData: null,
      mapStyle: SGoogleMapStylesString.dark,
      controller: Completer(),
      routePoints: [],
    );
  }

  StreamSubscription<LocationData>? _locationSub;

  @override
  Future<void> init() async {
    final currentLocationData = await SLocationController()
        .getCurrentLocation();
    state = state.copyWith(locationData: currentLocationData);
    moveToLocation(currentLocationData);
  }

  @override
  void start() {
    _locationSub = SLocationController().location.onLocationChanged.listen((
      LocationData currentLocation,
    ) {
      updatePolylines(currentLocation);
      moveToLocation(currentLocation);
    });
  }

  @override
  void stop() {
    _locationSub?.cancel();
    _locationSub = null;
  }

  @override
  Future<void> moveToLocation(
    LocationData locationData, {
    double zoom = 17,
  }) async {
    // ignore: no_leading_underscores_for_local_identifiers
    final _controller = await state.controller.future;
    _controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: fromLocationDataToLatLng(locationData),
          zoom: zoom,
        ),
      ),
    );
  }

  @override
  LatLng fromLocationDataToLatLng(LocationData locationData) {
    return LatLng(locationData.latitude ?? 0, locationData.longitude ?? 0);
  }

  @override
  Polyline createPolyline(List<LatLng> points) {
    return Polyline(
      polylineId: const PolylineId('newPoliline'),
      color: SAppColors.primary,
      points: state.routePoints,
      width: 10,
    );
  }

  @override
  void updatePolylines(LocationData locationData) {
    final newPoint = fromLocationDataToLatLng(locationData);
    final newRoutePoints = [...state.routePoints, newPoint];
    state = state.copyWith(routePoints: newRoutePoints);
    final newPolyline = {...state.polylines, createPolyline(state.routePoints)};

    state = state.copyWith(polylines: newPolyline);
  }
}
