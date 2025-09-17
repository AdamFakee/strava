import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:screenshot/screenshot.dart';
import 'package:strava/features/core/controllers/maps/map/map_controller_provider.dart';
import 'package:strava/features/core/controllers/maps/screen_shot/screen_shot_controller_provider.dart';

/// widget hiển thị gg map
class SGoogleMap extends ConsumerStatefulWidget {
  const SGoogleMap({
    super.key,
  });

  @override
  ConsumerState<SGoogleMap> createState() => _SGoogleMapState();
}

class _SGoogleMapState extends ConsumerState<SGoogleMap> {

  final Completer<GoogleMapController> _controller = Completer();
  
  @override
  void initState() {
    super.initState();
    ref.read(SMapControllerProvider.notifier).init();
  }

  @override
  void dispose() {
    _controller.future.then((c) => c.dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final locationData = ref.watch(SMapControllerProvider.select((state) => state.locationData));
    final mapStyle = ref.watch(SMapControllerProvider.select((state) => state.mapStyle));
    final polylines = ref.watch(SMapControllerProvider.select((state) => state.polylines));
    final state = ref.read(SMapControllerProvider);

    return Screenshot(
      controller: ref.read(SScreenShotControllerProvider).controller,
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(
            locationData?.latitude ?? 0.0,
            locationData?.longitude ?? 0.0,
          ),
        ),
        style: mapStyle,
        myLocationButtonEnabled: false,
        myLocationEnabled: true,
        polylines: polylines,
        onMapCreated: (GoogleMapController controller) async {
          _controller.complete(controller);
          state.controller.complete(controller);
          
        },
      ),
    );
  }
}
