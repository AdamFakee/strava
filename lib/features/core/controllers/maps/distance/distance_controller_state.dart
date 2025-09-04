import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:strava/features/core/controllers/maps/distance/distance_controller_abstract.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_provider.dart';

class SDistanceControllerState extends Notifier<SDistanceControllerStateType> implements SDistanceControllerAbstract {
  @override
  SDistanceControllerStateType build() {
    return SDistanceControllerStateType.init();
  }

  ProviderSubscription<List<LatLng>>? _distanceSub;

  @override
  void start () {
    _distanceSub = ref.listen<List<LatLng>>(
      SMapControllerProvider.select((s) => s.routePoints),
      (prev, next) {
        if (prev == null || next.length > prev.length) {
          final last = next.isNotEmpty ? next.last : null;
          final beforeLast = next.length > 1 ? next[next.length - 2] : null;

          if (last != null && beforeLast != null) {
            final add = _calculateDistance(beforeLast, last);
            state = state.copyWith(distance: state.distance + add);
          }
        }
      },
    );
  }

  @override
  void stop () {
    _distanceSub?.closed;
    _distanceSub = null;
    state = state.copyWith(distance: 0);
  }

  double _calculateDistance(LatLng start, LatLng end) {
    final double startLatitude = start.latitude;
    final double startLongitude = start.longitude;
    final double endLatitude = end.latitude;
    final double endLongitude = end.longitude;

    const double earthRadius = 6371.0; // Earth's radius in kilometers

    double dLat = _degreesToRadians(endLatitude - startLatitude);
    double dLon = _degreesToRadians(endLongitude - startLongitude);

    double a =
        sin(dLat / 2) * sin(dLat / 2) +
        cos(_degreesToRadians(startLatitude)) *
            cos(_degreesToRadians(endLatitude)) *
            sin(dLon / 2) *
            sin(dLon / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return earthRadius * c;
  }

  double _degreesToRadians(double degrees) {
    return degrees * pi / 180;
  }
}
