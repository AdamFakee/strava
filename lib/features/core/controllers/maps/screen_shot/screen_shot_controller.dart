import 'dart:typed_data';

import 'package:screenshot/screenshot.dart';
import 'package:strava/features/core/controllers/maps/screen_shot/screen_shot_controller_abstract.dart';

class SScreenShotController implements SScreenShotControllerAbstract {
  final ScreenshotController _controller = ScreenshotController();
  ScreenshotController get controller => _controller;

  @override
  void init() {
    // _controller = ScreenshotController();
  }

  @override
  Future<Uint8List?> screenShotGoogleMap() async {
    return await _controller.capture();
  }
}