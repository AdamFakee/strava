import 'dart:typed_data';

abstract class SScreenShotControllerAbstract {
  void init(); 

  Future<Uint8List?> screenShotGoogleMap ();
}